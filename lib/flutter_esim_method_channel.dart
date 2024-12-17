import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_esim_platform_interface.dart';

/// An implementation of [FlutterEsimPlatform] that uses method channels.
class MethodChannelFlutterEsim extends FlutterEsimPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_esim');

  @visibleForTesting
  final eventChannel = const EventChannel('flutter_esim_events');

  @override
  Future<bool> isSupportESim(List<String>? newer) async {
    final isSupportESim = await methodChannel.invokeMethod<bool>('isSupportESim', []);
    return isSupportESim ?? false;
  }

  @override
  Future<String> installEsimProfile(String profile) async {
    final result = await methodChannel.invokeMethod<String>('installEsimProfile', {'profile': profile});
    debugPrint("ProfileResult: $result");
    return result ?? "";
  }

  @override
  Stream<dynamic> get onEvent => eventChannel.receiveBroadcastStream().map((data) {
        debugPrint("Data: $data");
        return data;
      });
}
