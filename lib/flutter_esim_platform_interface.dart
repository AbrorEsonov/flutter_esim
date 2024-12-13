import 'dart:async';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_esim_method_channel.dart';

abstract class FlutterEsimPlatform extends PlatformInterface {
  /// Constructs a FlutterEsimPlatform.
  FlutterEsimPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterEsimPlatform _instance = MethodChannelFlutterEsim();

  /// The default instance of [FlutterEsimPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterEsim].
  static FlutterEsimPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterEsimPlatform] when
  /// they register themselves.
  static set instance(FlutterEsimPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> isSupportESim(List<String>? newer) {
    throw UnimplementedError('isSupportESim() has not been implemented.');
  }

  Future<String> installEsimProfile(String profile) {
    throw UnimplementedError('installEsimProfile() has not been implemented.');
  }

  Stream<EsimInstallResponse?> get onEvent =>
      throw UnimplementedError('onEvent() has not been implemented.');
}

class EsimInstallResponse {
  final String? event;
  final Map<String, dynamic> body;

  EsimInstallResponse({
    required this.event,
    required this.body,
  });

  factory EsimInstallResponse.fromJson(Map<String, dynamic> json) {
    return EsimInstallResponse(
      event: json['event'] as String,
      body: json['body'] as Map<String, dynamic>,
    );
  }

  int get resultCode => body['resultCode'] as int? ?? 0;
  String get message => body['message'] as String? ?? '';

  @override
  String toString() => 'EsimInstallResponse(event: $event, body: $body)';
}
