package com.apadmi.mockzilla.desktop.engine.device

import com.apadmi.mockzilla.lib.internal.models.LogEvent
import com.apadmi.mockzilla.management.MockzillaManagement
import kotlinx.coroutines.sync.Mutex
import kotlinx.coroutines.sync.withLock

interface MonitorLogsUseCase {
    suspend fun getMonitorLogs(device: Device): Result<Sequence<LogEvent>>
    suspend fun clearMonitorLogs(device: Device): Result<Unit>
}

class MonitorLogsUseCaseImpl(
    private val managementLogsService: MockzillaManagement.LogsService,
    private val managementMetaDataService: MockzillaManagement.MetaDataService,
) : MonitorLogsUseCase {
    private val mutex = Mutex()
    private val cache = mutableMapOf<CacheKey, Sequence<LogEvent>>()

    override suspend fun getMonitorLogs(device: Device): Result<Sequence<LogEvent>> = mutex.withLock {
        managementLogsService.fetchMonitorLogsAndClearBuffer(device, hideFromLogs = true).map { response ->
            val cacheKey = CacheKey(device, response.appPackage)
            val existingLogs = cache.getOrDefault(cacheKey, sequenceOf())
            (existingLogs + response.logs).also {
                cache[cacheKey] = it
            }
        }
    }

    override suspend fun clearMonitorLogs(device: Device): Result<Unit> = mutex.withLock {
        managementMetaDataService.fetchMetaData(device, hideFromLogs = true).map { response ->
            val cacheKey = CacheKey(device, response.appPackage)
            cache[cacheKey] = emptySequence()
        }
    }
}

/**
 * @property device
 * @property appPackage
 */
private data class CacheKey(val device: Device, val appPackage: String)
