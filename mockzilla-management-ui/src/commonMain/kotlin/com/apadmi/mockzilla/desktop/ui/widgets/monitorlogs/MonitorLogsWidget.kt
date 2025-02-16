package com.apadmi.mockzilla.desktop.ui.widgets.monitorlogs

import androidx.compose.foundation.Canvas
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.rememberLazyListState
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.material3.Button
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue
import androidx.compose.runtime.key
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp

import com.apadmi.mockzilla.desktop.di.utils.getViewModel
import com.apadmi.mockzilla.desktop.engine.device.Device
import com.apadmi.mockzilla.desktop.i18n.LocalStrings
import com.apadmi.mockzilla.desktop.i18n.Strings
import com.apadmi.mockzilla.desktop.ui.theme.alternatingBackground
import com.apadmi.mockzilla.desktop.ui.theme.httpStatusCode_1xx
import com.apadmi.mockzilla.desktop.ui.theme.httpStatusCode_2xx
import com.apadmi.mockzilla.desktop.ui.theme.httpStatusCode_3xx
import com.apadmi.mockzilla.desktop.ui.theme.httpStatusCode_4xx
import com.apadmi.mockzilla.desktop.ui.theme.httpStatusCode_5xx
import com.apadmi.mockzilla.lib.internal.models.LogEvent

import io.ktor.http.HttpStatusCode
import org.koin.core.parameter.parametersOf

@Suppress("MAGIC_NUMBER")
private fun HttpStatusCode.color() = when (this.value) {
    in 100..199 -> httpStatusCode_1xx
    in 200..299 -> httpStatusCode_2xx
    in 300..399 -> httpStatusCode_3xx
    in 400..499 -> httpStatusCode_4xx
    in 500..599 -> httpStatusCode_5xx
    else -> Color.Black
}

@Composable
fun MonitorLogsWidget(
    device: Device
) {
    val viewModel = getViewModel<MonitorLogsViewModel>(key = device.toString()) { parametersOf(device) }
    val state by viewModel.state.collectAsState()

    MonitorLogsWidgetContent(state = state, onClearAll = viewModel::clearLogs)
}

@Composable
fun MonitorLogsWidgetContent(
    state: MonitorLogsViewModel.State.DisplayLogs,
    onClearAll: () -> Unit,
    strings: Strings = LocalStrings.current,
) = Row {
    MonitorLogsList(
        entries = state.entries,
        modifier = Modifier.weight(1F)
    )
    Column(modifier = Modifier.verticalScroll(rememberScrollState())) {
        Surface(modifier = Modifier.padding(8.dp)) {
            Button(
                onClick = onClearAll,
            ) {
                Text(text = strings.widgets.logs.clearAll)
            }
        }
    }
}

@Composable
fun LogRow(modifier: Modifier, event: LogEvent) =
    Row(
        modifier = modifier
            .padding(2.dp),
        verticalAlignment = Alignment.CenterVertically
    ) {
        Canvas(
            modifier = Modifier.size(15.dp).padding(end = 4.dp),
            onDraw = { drawCircle(color = event.status.color()) })
        Text("${event.status.description} ${event.method}: ${event.url}")
    }

@Composable
private fun MonitorLogsList(
    entries: Sequence<LogEvent>,
    modifier: Modifier = Modifier,
) {
    val state = rememberLazyListState()
    val entryList = entries.toList()
    var previousSize by remember { mutableStateOf(entryList.size) }
    LaunchedEffect(previousSize, entryList.size) {
        val previous = previousSize
        val current = entryList.size
        if (previous != current) {
            // Because we know entries can only be appended or cleared, we can check if the new
            // list is bigger than the previous list and infer that a new entry was added to the
            // end of the sequence if so
            if (current > previous) {
                // In such a case, if the user was scrolled down to the end of the logs we should
                // autoscroll them to remain there
                val previousLastItemIndex = state.layoutInfo.visibleItemsInfo.maxOf { it.index }
                if (previousLastItemIndex >= previous - 1) {
                    state.scrollToItem(entryList.lastIndex)
                }
            }
            previousSize = current
        }
    }
    LazyColumn(modifier = modifier, state = state) {
        entryList.forEachIndexed { index, logEvent ->
            item {
                LogRow(Modifier.fillMaxWidth().alternatingBackground(index), logEvent)
            }
        }
    }
}
