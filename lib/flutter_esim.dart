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

  Stream<EsimInstallResponse?> get onEvent => FlutterEsimPlatform.instance.onEvent;

  Future<EsimInstallResponse?> waitForSuccessEvent({Duration timeout = const Duration(seconds: 10)}) async {
    try {
      return FlutterEsimPlatform.instance.onEvent.where((event) => event?.event == "1").timeout(timeout).first;
    } on TimeoutException {
      return null;
    }
  }
}
