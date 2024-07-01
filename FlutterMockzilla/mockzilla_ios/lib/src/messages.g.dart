// Autogenerated from Pigeon (v12.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';
List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}

enum BridgeHttpMethod {
  get,
  head,
  post,
  put,
  delete,
  options,
  patch,
}

enum BridgeLogLevel {
  debug,
  error,
  info,
  verbose,
  warn,
  assertion,
}

class BridgeMockzillaHttpRequest {
  BridgeMockzillaHttpRequest({
    required this.uri,
    required this.headers,
    required this.body,
    required this.method,
  });

  String uri;

  Map<String?, String?> headers;

  String body;

  BridgeHttpMethod method;

  Object encode() {
    return <Object?>[
      uri,
      headers,
      body,
      method.index,
    ];
  }

  static BridgeMockzillaHttpRequest decode(Object result) {
    result as List<Object?>;
    return BridgeMockzillaHttpRequest(
      uri: result[0]! as String,
      headers: (result[1] as Map<Object?, Object?>?)!.cast<String?, String?>(),
      body: result[2]! as String,
      method: BridgeHttpMethod.values[result[3]! as int],
    );
  }
}

class BridgeMockzillaHttpResponse {
  BridgeMockzillaHttpResponse({
    required this.statusCode,
    required this.headers,
    required this.body,
  });

  int statusCode;

  Map<String?, String?> headers;

  String body;

  Object encode() {
    return <Object?>[
      statusCode,
      headers,
      body,
    ];
  }

  static BridgeMockzillaHttpResponse decode(Object result) {
    result as List<Object?>;
    return BridgeMockzillaHttpResponse(
      statusCode: result[0]! as int,
      headers: (result[1] as Map<Object?, Object?>?)!.cast<String?, String?>(),
      body: result[2]! as String,
    );
  }
}

class BridgeEndpointConfig {
  BridgeEndpointConfig({
    required this.name,
    required this.key,
    required this.failureProbability,
    required this.delayMean,
    required this.delayVariance,
    this.webApiDefaultResponse,
    this.webApiErrorResponse,
  });

  String name;

  String key;

  int failureProbability;

  int delayMean;

  int delayVariance;

  BridgeMockzillaHttpResponse? webApiDefaultResponse;

  BridgeMockzillaHttpResponse? webApiErrorResponse;

  Object encode() {
    return <Object?>[
      name,
      key,
      failureProbability,
      delayMean,
      delayVariance,
      webApiDefaultResponse?.encode(),
      webApiErrorResponse?.encode(),
    ];
  }

  static BridgeEndpointConfig decode(Object result) {
    result as List<Object?>;
    return BridgeEndpointConfig(
      name: result[0]! as String,
      key: result[1]! as String,
      failureProbability: result[2]! as int,
      delayMean: result[3]! as int,
      delayVariance: result[4]! as int,
      webApiDefaultResponse: result[5] != null
          ? BridgeMockzillaHttpResponse.decode(result[5]! as List<Object?>)
          : null,
      webApiErrorResponse: result[6] != null
          ? BridgeMockzillaHttpResponse.decode(result[6]! as List<Object?>)
          : null,
    );
  }
}

class BridgeReleaseModeConfig {
  BridgeReleaseModeConfig({
    required this.rateLimit,
    required this.rateLimitRefillPeriodMillis,
    required this.tokenLifeSpanMillis,
  });

  int rateLimit;

  int rateLimitRefillPeriodMillis;

  int tokenLifeSpanMillis;

  Object encode() {
    return <Object?>[
      rateLimit,
      rateLimitRefillPeriodMillis,
      tokenLifeSpanMillis,
    ];
  }

  static BridgeReleaseModeConfig decode(Object result) {
    result as List<Object?>;
    return BridgeReleaseModeConfig(
      rateLimit: result[0]! as int,
      rateLimitRefillPeriodMillis: result[1]! as int,
      tokenLifeSpanMillis: result[2]! as int,
    );
  }
}

class BridgeMockzillaConfig {
  BridgeMockzillaConfig({
    required this.port,
    required this.endpoints,
    required this.isRelease,
    required this.localHostOnly,
    required this.logLevel,
    required this.releaseModeConfig,
  });

  int port;

  List<BridgeEndpointConfig?> endpoints;

  bool isRelease;

  bool localHostOnly;

  BridgeLogLevel logLevel;

  BridgeReleaseModeConfig releaseModeConfig;

  Object encode() {
    return <Object?>[
      port,
      endpoints,
      isRelease,
      localHostOnly,
      logLevel.index,
      releaseModeConfig.encode(),
    ];
  }

  static BridgeMockzillaConfig decode(Object result) {
    result as List<Object?>;
    return BridgeMockzillaConfig(
      port: result[0]! as int,
      endpoints: (result[1] as List<Object?>?)!.cast<BridgeEndpointConfig?>(),
      isRelease: result[2]! as bool,
      localHostOnly: result[3]! as bool,
      logLevel: BridgeLogLevel.values[result[4]! as int],
      releaseModeConfig: BridgeReleaseModeConfig.decode(result[5]! as List<Object?>),
    );
  }
}

class BridgeMockzillaRuntimeParams {
  BridgeMockzillaRuntimeParams({
    required this.config,
    required this.mockBaseUrl,
    required this.apiBaseUrl,
    required this.port,
  });

  BridgeMockzillaConfig config;

  String mockBaseUrl;

  String apiBaseUrl;

  int port;

  Object encode() {
    return <Object?>[
      config.encode(),
      mockBaseUrl,
      apiBaseUrl,
      port,
    ];
  }

  static BridgeMockzillaRuntimeParams decode(Object result) {
    result as List<Object?>;
    return BridgeMockzillaRuntimeParams(
      config: BridgeMockzillaConfig.decode(result[0]! as List<Object?>),
      mockBaseUrl: result[1]! as String,
      apiBaseUrl: result[2]! as String,
      port: result[3]! as int,
    );
  }
}

class BridgeAuthHeader {
  BridgeAuthHeader({
    required this.key,
    required this.value,
  });

  String key;

  String value;

  Object encode() {
    return <Object?>[
      key,
      value,
    ];
  }

  static BridgeAuthHeader decode(Object result) {
    result as List<Object?>;
    return BridgeAuthHeader(
      key: result[0]! as String,
      value: result[1]! as String,
    );
  }
}

class _MockzillaHostApiCodec extends StandardMessageCodec {
  const _MockzillaHostApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is BridgeEndpointConfig) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is BridgeMockzillaConfig) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is BridgeMockzillaHttpResponse) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is BridgeMockzillaRuntimeParams) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is BridgeReleaseModeConfig) {
      buffer.putUint8(132);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return BridgeEndpointConfig.decode(readValue(buffer)!);
      case 129: 
        return BridgeMockzillaConfig.decode(readValue(buffer)!);
      case 130: 
        return BridgeMockzillaHttpResponse.decode(readValue(buffer)!);
      case 131: 
        return BridgeMockzillaRuntimeParams.decode(readValue(buffer)!);
      case 132: 
        return BridgeReleaseModeConfig.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

class MockzillaHostApi {
  /// Constructor for [MockzillaHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  MockzillaHostApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _MockzillaHostApiCodec();

  Future<BridgeMockzillaRuntimeParams> startServer(BridgeMockzillaConfig arg_config) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mockzilla_ios.MockzillaHostApi.startServer', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_config]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as BridgeMockzillaRuntimeParams?)!;
    }
  }

  Future<void> stopServer() async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.mockzilla_ios.MockzillaHostApi.stopServer', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(null) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else {
      return;
    }
  }
}

class _MockzillaFlutterApiCodec extends StandardMessageCodec {
  const _MockzillaFlutterApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is BridgeAuthHeader) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is BridgeMockzillaHttpRequest) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is BridgeMockzillaHttpResponse) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return BridgeAuthHeader.decode(readValue(buffer)!);
      case 129: 
        return BridgeMockzillaHttpRequest.decode(readValue(buffer)!);
      case 130: 
        return BridgeMockzillaHttpResponse.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class MockzillaFlutterApi {
  static const MessageCodec<Object?> codec = _MockzillaFlutterApiCodec();

  bool endpointMatcher(BridgeMockzillaHttpRequest request, String key);

  BridgeMockzillaHttpResponse defaultHandler(BridgeMockzillaHttpRequest request, String key);

  BridgeMockzillaHttpResponse errorHandler(BridgeMockzillaHttpRequest request, String key);

  Future<BridgeAuthHeader> generateAuthHeader();

  void log(BridgeLogLevel logLevel, String message, String tag, String? exception);

  static void setup(MockzillaFlutterApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.endpointMatcher', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.endpointMatcher was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final BridgeMockzillaHttpRequest? arg_request = (args[0] as BridgeMockzillaHttpRequest?);
          assert(arg_request != null,
              'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.endpointMatcher was null, expected non-null BridgeMockzillaHttpRequest.');
          final String? arg_key = (args[1] as String?);
          assert(arg_key != null,
              'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.endpointMatcher was null, expected non-null String.');
          try {
            final bool output = api.endpointMatcher(arg_request!, arg_key!);
            return wrapResponse(result: output);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.defaultHandler', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.defaultHandler was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final BridgeMockzillaHttpRequest? arg_request = (args[0] as BridgeMockzillaHttpRequest?);
          assert(arg_request != null,
              'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.defaultHandler was null, expected non-null BridgeMockzillaHttpRequest.');
          final String? arg_key = (args[1] as String?);
          assert(arg_key != null,
              'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.defaultHandler was null, expected non-null String.');
          try {
            final BridgeMockzillaHttpResponse output = api.defaultHandler(arg_request!, arg_key!);
            return wrapResponse(result: output);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.errorHandler', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.errorHandler was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final BridgeMockzillaHttpRequest? arg_request = (args[0] as BridgeMockzillaHttpRequest?);
          assert(arg_request != null,
              'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.errorHandler was null, expected non-null BridgeMockzillaHttpRequest.');
          final String? arg_key = (args[1] as String?);
          assert(arg_key != null,
              'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.errorHandler was null, expected non-null String.');
          try {
            final BridgeMockzillaHttpResponse output = api.errorHandler(arg_request!, arg_key!);
            return wrapResponse(result: output);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.generateAuthHeader', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          try {
            final BridgeAuthHeader output = await api.generateAuthHeader();
            return wrapResponse(result: output);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.log', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.log was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final BridgeLogLevel? arg_logLevel = args[0] == null ? null : BridgeLogLevel.values[args[0]! as int];
          assert(arg_logLevel != null,
              'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.log was null, expected non-null BridgeLogLevel.');
          final String? arg_message = (args[1] as String?);
          assert(arg_message != null,
              'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.log was null, expected non-null String.');
          final String? arg_tag = (args[2] as String?);
          assert(arg_tag != null,
              'Argument for dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.log was null, expected non-null String.');
          final String? arg_exception = (args[3] as String?);
          try {
            api.log(arg_logLevel!, arg_message!, arg_tag!, arg_exception);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
