// Autogenerated from Pigeon (v12.0.1), do not edit directly.
// See also: https://pub.dev/packages/pigeon

import Foundation
#if os(iOS)
import Flutter
#elseif os(macOS)
import FlutterMacOS
#else
#error("Unsupported platform.")
#endif

private func isNullish(_ value: Any?) -> Bool {
  return value is NSNull || value == nil
}

private func wrapResult(_ result: Any?) -> [Any?] {
  return [result]
}

private func wrapError(_ error: Any) -> [Any?] {
  if let flutterError = error as? FlutterError {
    return [
      flutterError.code,
      flutterError.message,
      flutterError.details
    ]
  }
  return [
    "\(error)",
    "\(type(of: error))",
    "Stacktrace: \(Thread.callStackSymbols)"
  ]
}

private func nilOrValue<T>(_ value: Any?) -> T? {
  if value is NSNull { return nil }
  return value as! T?
}

enum BridgeHttpMethod: Int {
  case get = 0
  case head = 1
  case post = 2
  case put = 3
  case delete = 4
  case options = 5
  case patch = 6
}

enum BridgeLogLevel: Int {
  case debug = 0
  case error = 1
  case info = 2
  case verbose = 3
  case warn = 4
  case assertion = 5
}

/// Generated class from Pigeon that represents data sent in messages.
struct BridgeMockzillaHttpRequest {
  var uri: String
  var headers: [String?: String?]
  var body: String
  var method: BridgeHttpMethod

  static func fromList(_ list: [Any?]) -> BridgeMockzillaHttpRequest? {
    let uri = list[0] as! String
    let headers = list[1] as! [String?: String?]
    let body = list[2] as! String
    let method = BridgeHttpMethod(rawValue: list[3] as! Int)!

    return BridgeMockzillaHttpRequest(
      uri: uri,
      headers: headers,
      body: body,
      method: method
    )
  }
  func toList() -> [Any?] {
    return [
      uri,
      headers,
      body,
      method.rawValue,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct BridgeMockzillaHttpResponse {
  var statusCode: Int64
  var headers: [String?: String?]
  var body: String

  static func fromList(_ list: [Any?]) -> BridgeMockzillaHttpResponse? {
    let statusCode = list[0] is Int64 ? list[0] as! Int64 : Int64(list[0] as! Int32)
    let headers = list[1] as! [String?: String?]
    let body = list[2] as! String

    return BridgeMockzillaHttpResponse(
      statusCode: statusCode,
      headers: headers,
      body: body
    )
  }
  func toList() -> [Any?] {
    return [
      statusCode,
      headers,
      body,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct BridgeEndpointConfig {
  var name: String
  var key: String
  var failureProbability: Int64? = nil
  var delayMean: Int64? = nil
  var delayVariance: Int64? = nil
  var webApiDefaultResponse: BridgeMockzillaHttpResponse? = nil
  var webApiErrorResponse: BridgeMockzillaHttpResponse? = nil

  static func fromList(_ list: [Any?]) -> BridgeEndpointConfig? {
    let name = list[0] as! String
    let key = list[1] as! String
    let failureProbability: Int64? = isNullish(list[2]) ? nil : (list[2] is Int64? ? list[2] as! Int64? : Int64(list[2] as! Int32))
    let delayMean: Int64? = isNullish(list[3]) ? nil : (list[3] is Int64? ? list[3] as! Int64? : Int64(list[3] as! Int32))
    let delayVariance: Int64? = isNullish(list[4]) ? nil : (list[4] is Int64? ? list[4] as! Int64? : Int64(list[4] as! Int32))
    var webApiDefaultResponse: BridgeMockzillaHttpResponse? = nil
    if let webApiDefaultResponseList: [Any?] = nilOrValue(list[5]) {
      webApiDefaultResponse = BridgeMockzillaHttpResponse.fromList(webApiDefaultResponseList)
    }
    var webApiErrorResponse: BridgeMockzillaHttpResponse? = nil
    if let webApiErrorResponseList: [Any?] = nilOrValue(list[6]) {
      webApiErrorResponse = BridgeMockzillaHttpResponse.fromList(webApiErrorResponseList)
    }

    return BridgeEndpointConfig(
      name: name,
      key: key,
      failureProbability: failureProbability,
      delayMean: delayMean,
      delayVariance: delayVariance,
      webApiDefaultResponse: webApiDefaultResponse,
      webApiErrorResponse: webApiErrorResponse
    )
  }
  func toList() -> [Any?] {
    return [
      name,
      key,
      failureProbability,
      delayMean,
      delayVariance,
      webApiDefaultResponse?.toList(),
      webApiErrorResponse?.toList(),
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct BridgeReleaseModeConfig {
  var rateLimit: Int64
  var rateLimitRefillPeriodMillis: Int64
  var tokenLifeSpanMillis: Int64

  static func fromList(_ list: [Any?]) -> BridgeReleaseModeConfig? {
    let rateLimit = list[0] is Int64 ? list[0] as! Int64 : Int64(list[0] as! Int32)
    let rateLimitRefillPeriodMillis = list[1] is Int64 ? list[1] as! Int64 : Int64(list[1] as! Int32)
    let tokenLifeSpanMillis = list[2] is Int64 ? list[2] as! Int64 : Int64(list[2] as! Int32)

    return BridgeReleaseModeConfig(
      rateLimit: rateLimit,
      rateLimitRefillPeriodMillis: rateLimitRefillPeriodMillis,
      tokenLifeSpanMillis: tokenLifeSpanMillis
    )
  }
  func toList() -> [Any?] {
    return [
      rateLimit,
      rateLimitRefillPeriodMillis,
      tokenLifeSpanMillis,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct BridgeMockzillaConfig {
  var port: Int64
  var endpoints: [BridgeEndpointConfig?]
  var isRelease: Bool
  var localHostOnly: Bool
  var logLevel: BridgeLogLevel
  var releaseModeConfig: BridgeReleaseModeConfig

  static func fromList(_ list: [Any?]) -> BridgeMockzillaConfig? {
    let port = list[0] is Int64 ? list[0] as! Int64 : Int64(list[0] as! Int32)
    let endpoints = list[1] as! [BridgeEndpointConfig?]
    let isRelease = list[2] as! Bool
    let localHostOnly = list[3] as! Bool
    let logLevel = BridgeLogLevel(rawValue: list[4] as! Int)!
    let releaseModeConfig = BridgeReleaseModeConfig.fromList(list[5] as! [Any?])!

    return BridgeMockzillaConfig(
      port: port,
      endpoints: endpoints,
      isRelease: isRelease,
      localHostOnly: localHostOnly,
      logLevel: logLevel,
      releaseModeConfig: releaseModeConfig
    )
  }
  func toList() -> [Any?] {
    return [
      port,
      endpoints,
      isRelease,
      localHostOnly,
      logLevel.rawValue,
      releaseModeConfig.toList(),
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct BridgeMockzillaRuntimeParams {
  var config: BridgeMockzillaConfig
  var mockBaseUrl: String
  var apiBaseUrl: String
  var port: Int64

  static func fromList(_ list: [Any?]) -> BridgeMockzillaRuntimeParams? {
    let config = BridgeMockzillaConfig.fromList(list[0] as! [Any?])!
    let mockBaseUrl = list[1] as! String
    let apiBaseUrl = list[2] as! String
    let port = list[3] is Int64 ? list[3] as! Int64 : Int64(list[3] as! Int32)

    return BridgeMockzillaRuntimeParams(
      config: config,
      mockBaseUrl: mockBaseUrl,
      apiBaseUrl: apiBaseUrl,
      port: port
    )
  }
  func toList() -> [Any?] {
    return [
      config.toList(),
      mockBaseUrl,
      apiBaseUrl,
      port,
    ]
  }
}

/// Generated class from Pigeon that represents data sent in messages.
struct BridgeAuthHeader {
  var key: String
  var value: String

  static func fromList(_ list: [Any?]) -> BridgeAuthHeader? {
    let key = list[0] as! String
    let value = list[1] as! String

    return BridgeAuthHeader(
      key: key,
      value: value
    )
  }
  func toList() -> [Any?] {
    return [
      key,
      value,
    ]
  }
}
private class MockzillaHostApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return BridgeEndpointConfig.fromList(self.readValue() as! [Any?])
      case 129:
        return BridgeMockzillaConfig.fromList(self.readValue() as! [Any?])
      case 130:
        return BridgeMockzillaHttpResponse.fromList(self.readValue() as! [Any?])
      case 131:
        return BridgeMockzillaRuntimeParams.fromList(self.readValue() as! [Any?])
      case 132:
        return BridgeReleaseModeConfig.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class MockzillaHostApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? BridgeEndpointConfig {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? BridgeMockzillaConfig {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else if let value = value as? BridgeMockzillaHttpResponse {
      super.writeByte(130)
      super.writeValue(value.toList())
    } else if let value = value as? BridgeMockzillaRuntimeParams {
      super.writeByte(131)
      super.writeValue(value.toList())
    } else if let value = value as? BridgeReleaseModeConfig {
      super.writeByte(132)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class MockzillaHostApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return MockzillaHostApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return MockzillaHostApiCodecWriter(data: data)
  }
}

class MockzillaHostApiCodec: FlutterStandardMessageCodec {
  static let shared = MockzillaHostApiCodec(readerWriter: MockzillaHostApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents a handler of messages from Flutter.
protocol MockzillaHostApi {
  func startServer(config: BridgeMockzillaConfig) throws -> BridgeMockzillaRuntimeParams
  func stopServer() throws
}

/// Generated setup class from Pigeon to handle messages through the `binaryMessenger`.
class MockzillaHostApiSetup {
  /// The codec used by MockzillaHostApi.
  static var codec: FlutterStandardMessageCodec { MockzillaHostApiCodec.shared }
  /// Sets up an instance of `MockzillaHostApi` to handle messages through the `binaryMessenger`.
  static func setUp(binaryMessenger: FlutterBinaryMessenger, api: MockzillaHostApi?) {
    let startServerChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mockzilla_ios.MockzillaHostApi.startServer", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      startServerChannel.setMessageHandler { message, reply in
        let args = message as! [Any?]
        let configArg = args[0] as! BridgeMockzillaConfig
        do {
          let result = try api.startServer(config: configArg)
          reply(wrapResult(result))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      startServerChannel.setMessageHandler(nil)
    }
    let stopServerChannel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mockzilla_ios.MockzillaHostApi.stopServer", binaryMessenger: binaryMessenger, codec: codec)
    if let api = api {
      stopServerChannel.setMessageHandler { _, reply in
        do {
          try api.stopServer()
          reply(wrapResult(nil))
        } catch {
          reply(wrapError(error))
        }
      }
    } else {
      stopServerChannel.setMessageHandler(nil)
    }
  }
}
private class MockzillaFlutterApiCodecReader: FlutterStandardReader {
  override func readValue(ofType type: UInt8) -> Any? {
    switch type {
      case 128:
        return BridgeAuthHeader.fromList(self.readValue() as! [Any?])
      case 129:
        return BridgeMockzillaHttpRequest.fromList(self.readValue() as! [Any?])
      case 130:
        return BridgeMockzillaHttpResponse.fromList(self.readValue() as! [Any?])
      default:
        return super.readValue(ofType: type)
    }
  }
}

private class MockzillaFlutterApiCodecWriter: FlutterStandardWriter {
  override func writeValue(_ value: Any) {
    if let value = value as? BridgeAuthHeader {
      super.writeByte(128)
      super.writeValue(value.toList())
    } else if let value = value as? BridgeMockzillaHttpRequest {
      super.writeByte(129)
      super.writeValue(value.toList())
    } else if let value = value as? BridgeMockzillaHttpResponse {
      super.writeByte(130)
      super.writeValue(value.toList())
    } else {
      super.writeValue(value)
    }
  }
}

private class MockzillaFlutterApiCodecReaderWriter: FlutterStandardReaderWriter {
  override func reader(with data: Data) -> FlutterStandardReader {
    return MockzillaFlutterApiCodecReader(data: data)
  }

  override func writer(with data: NSMutableData) -> FlutterStandardWriter {
    return MockzillaFlutterApiCodecWriter(data: data)
  }
}

class MockzillaFlutterApiCodec: FlutterStandardMessageCodec {
  static let shared = MockzillaFlutterApiCodec(readerWriter: MockzillaFlutterApiCodecReaderWriter())
}

/// Generated protocol from Pigeon that represents Flutter messages that can be called from Swift.
protocol MockzillaFlutterApiProtocol {
  func endpointMatcher(request requestArg: BridgeMockzillaHttpRequest, key keyArg: String, completion: @escaping (Result<Bool, FlutterError>) -> Void) 
  func defaultHandler(request requestArg: BridgeMockzillaHttpRequest, key keyArg: String, completion: @escaping (Result<BridgeMockzillaHttpResponse, FlutterError>) -> Void) 
  func errorHandler(request requestArg: BridgeMockzillaHttpRequest, key keyArg: String, completion: @escaping (Result<BridgeMockzillaHttpResponse, FlutterError>) -> Void) 
  func generateAuthHeader(completion: @escaping (Result<BridgeAuthHeader, FlutterError>) -> Void) 
  func log(logLevel logLevelArg: BridgeLogLevel, message messageArg: String, tag tagArg: String, exception exceptionArg: String?, completion: @escaping (Result<Void, FlutterError>) -> Void) 
}
class MockzillaFlutterApi: MockzillaFlutterApiProtocol {
  private let binaryMessenger: FlutterBinaryMessenger
  init(binaryMessenger: FlutterBinaryMessenger){
    self.binaryMessenger = binaryMessenger
  }
  var codec: FlutterStandardMessageCodec {
    return MockzillaFlutterApiCodec.shared
  }
  func endpointMatcher(request requestArg: BridgeMockzillaHttpRequest, key keyArg: String, completion: @escaping (Result<Bool, FlutterError>) -> Void)  {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.endpointMatcher", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([requestArg, keyArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(FlutterError(code: "channel-error", message: "Unable to establish connection on channel.", details: "")))
        return
      }
      if (listResponse.count > 1) {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)));
      } else if (listResponse[0] == nil) {
        completion(.failure(FlutterError(code: "null-error", message: "Flutter api returned null value for non-null return value.", details: "")))
      } else {
        let result = listResponse[0] as! Bool
        completion(.success(result))
      }
    }
  }
  func defaultHandler(request requestArg: BridgeMockzillaHttpRequest, key keyArg: String, completion: @escaping (Result<BridgeMockzillaHttpResponse, FlutterError>) -> Void)  {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.defaultHandler", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([requestArg, keyArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(FlutterError(code: "channel-error", message: "Unable to establish connection on channel.", details: "")))
        return
      }
      if (listResponse.count > 1) {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)));
      } else if (listResponse[0] == nil) {
        completion(.failure(FlutterError(code: "null-error", message: "Flutter api returned null value for non-null return value.", details: "")))
      } else {
        let result = listResponse[0] as! BridgeMockzillaHttpResponse
        completion(.success(result))
      }
    }
  }
  func errorHandler(request requestArg: BridgeMockzillaHttpRequest, key keyArg: String, completion: @escaping (Result<BridgeMockzillaHttpResponse, FlutterError>) -> Void)  {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.errorHandler", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([requestArg, keyArg] as [Any?]) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(FlutterError(code: "channel-error", message: "Unable to establish connection on channel.", details: "")))
        return
      }
      if (listResponse.count > 1) {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)));
      } else if (listResponse[0] == nil) {
        completion(.failure(FlutterError(code: "null-error", message: "Flutter api returned null value for non-null return value.", details: "")))
      } else {
        let result = listResponse[0] as! BridgeMockzillaHttpResponse
        completion(.success(result))
      }
    }
  }
  func generateAuthHeader(completion: @escaping (Result<BridgeAuthHeader, FlutterError>) -> Void)  {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.generateAuthHeader", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage(nil) { response in
      guard let listResponse = response as? [Any?] else {
        completion(.failure(FlutterError(code: "channel-error", message: "Unable to establish connection on channel.", details: "")))
        return
      }
      if (listResponse.count > 1) {
        let code: String = listResponse[0] as! String
        let message: String? = nilOrValue(listResponse[1])
        let details: String? = nilOrValue(listResponse[2])
        completion(.failure(FlutterError(code: code, message: message, details: details)));
      } else if (listResponse[0] == nil) {
        completion(.failure(FlutterError(code: "null-error", message: "Flutter api returned null value for non-null return value.", details: "")))
      } else {
        let result = listResponse[0] as! BridgeAuthHeader
        completion(.success(result))
      }
    }
  }
  func log(logLevel logLevelArg: BridgeLogLevel, message messageArg: String, tag tagArg: String, exception exceptionArg: String?, completion: @escaping (Result<Void, FlutterError>) -> Void)  {
    let channel = FlutterBasicMessageChannel(name: "dev.flutter.pigeon.mockzilla_ios.MockzillaFlutterApi.log", binaryMessenger: binaryMessenger, codec: codec)
    channel.sendMessage([logLevelArg.rawValue, messageArg, tagArg, exceptionArg] as [Any?]) { _ in
      completion(.success(Void()))
    }
  }
}
