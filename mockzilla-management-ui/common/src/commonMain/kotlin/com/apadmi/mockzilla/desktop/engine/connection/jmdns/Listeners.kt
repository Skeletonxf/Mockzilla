package com.apadmi.mockzilla.desktop.engine.connection.jmdns

import javax.jmdns.ServiceEvent
import javax.jmdns.ServiceListener
import javax.jmdns.ServiceTypeListener


internal class ServiceTypeAddedListener(
    val onTypeAdded: (event: ServiceEvent?) -> Unit
) : ServiceTypeListener {
    override fun serviceTypeAdded(event: ServiceEvent?) = onTypeAdded(event)
    override fun subTypeForServiceTypeAdded(event: ServiceEvent?) { /* No-op */ }
}

internal class ServiceEventResolvedListener(
    val onServiceResolved: (event: ServiceEvent?) -> Unit
): ServiceListener {
    override fun serviceAdded(event: ServiceEvent?) { /* No-Op */ }

    override fun serviceRemoved(event: ServiceEvent?) { /* No-Op */ }

    override fun serviceResolved(event: ServiceEvent?) = onServiceResolved(event)

}
