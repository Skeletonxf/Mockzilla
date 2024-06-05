package com.apadmi.mockzilla.lib.internal.discovery

import com.apadmi.mockzilla.lib.models.MetaData

interface ZeroConfDiscoveryService {
    suspend fun makeDiscoverable(metaData: MetaData, port: Int)
}
