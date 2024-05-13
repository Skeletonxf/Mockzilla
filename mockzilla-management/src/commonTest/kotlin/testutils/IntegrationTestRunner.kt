package com.apadmi.mockzilla.testutils

import com.apadmi.mockzilla.lib.models.EndpointConfiguration
import com.apadmi.mockzilla.lib.models.MockzillaConfig
import com.apadmi.mockzilla.lib.models.MockzillaRuntimeParams
import com.apadmi.mockzilla.lib.startMockzilla
import com.apadmi.mockzilla.lib.stopMockzilla
import com.apadmi.mockzilla.management.MockzillaConnectionConfig
import com.apadmi.mockzilla.management.MockzillaManagement
import com.apadmi.mockzilla.management.internal.MockzillaManagementRepository
import com.apadmi.mockzilla.management.internal.MockzillaManagementRepositoryImpl
import io.ktor.client.plugins.logging.Logger
import io.ktor.client.plugins.logging.SIMPLE
import kotlinx.coroutines.runBlocking

private typealias TestBlock<Sut> = suspend (
    sut: Sut,
    connection: MockzillaConnectionConfig,
    runtimeParams: MockzillaRuntimeParams
) -> Unit

internal fun <Sut> runIntegrationTest(
    appName: String = "dummy-app-name",
    appVersion: String = "dummy-app-version",
    config: MockzillaConfig = MockzillaConfig.Builder().setPort(0).addEndpoint(
        EndpointConfiguration.Builder("Id").build()
    )
        .build(),
    createSut: (MockzillaManagementRepository) -> Sut,
    testBlock: TestBlock<Sut>
) = runBlocking {
    /* Setup */
    val sut = MockzillaManagementRepositoryImpl.create(logger = Logger.SIMPLE)
    val runtimeParams = startMockzilla(appName, appVersion, config)

    /* Run Test */
    testBlock(
        createSut(sut),
        MockzillaConnectionConfigImpl("127.0.0.1", port = runtimeParams.port.toString()),
        runtimeParams
    )

    /* Cleanup */
    stopMockzilla()
}
