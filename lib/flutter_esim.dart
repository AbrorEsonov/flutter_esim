import 'dart:async';

import 'flutter_esim_platform_interface.dart';

class FlutterEsim {
  /// Check support eSIM.
  Future<bool> isSupportESim(List<String>? newer) async {
    return FlutterEsimPlatform.instance.isSupportESim(newer);
  }

  /// Install eSIM.
  Future<String> installEsimProfile(String profile) async {
    return FlutterEsimPlatform.instance.installEsimProfile(profile);
  }

  Stream<dynamic> get onEvent => FlutterEsimPlatform.instance.onEvent;
}
