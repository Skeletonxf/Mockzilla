package com.apadmi.mockzilla.lib

import com.apadmi.mockzilla.lib.internal.di.DependencyInjector
import com.apadmi.mockzilla.lib.internal.service.validate
import com.apadmi.mockzilla.lib.internal.startServer
import com.apadmi.mockzilla.lib.internal.stopServer
import com.apadmi.mockzilla.lib.internal.utils.FileIo
import com.apadmi.mockzilla.lib.models.MetaData
import com.apadmi.mockzilla.lib.models.MockzillaConfig
import com.apadmi.mockzilla.lib.service.toKermitLogWriter

import co.touchlab.kermit.Logger
import co.touchlab.kermit.StaticConfig
import co.touchlab.kermit.platformLogWriter

/**
 * Stops the Mockzilla server,
 */
fun stopMockzilla() {
    stopServer()
}

internal fun startMockzilla(
    config: MockzillaConfig,
    metaData: MetaData,
    fileIo: FileIo
) = startMockzilla(config, prepareMockzilla(config, metaData, fileIo, Logger(
    StaticConfig(
        config.logLevel.toKermitSeverity(),
        listOf(platformLogWriter()) + config.additionalLogWriters.map { it.toKermitLogWriter() }
    ), "Mockzilla"
)))

internal fun prepareMockzilla(
    config: MockzillaConfig,
    metaData: MetaData,
    fileIo: FileIo,
    logger: Logger,
) = DependencyInjector(config, metaData, fileIo, logger).also {
    config.validate()
}

internal fun startMockzilla(
    config: MockzillaConfig,
    di: DependencyInjector,
) = startServer(config.port, di)
