import 'dart:async';

import 'esim_install_response.dart';
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
      print("Trying sometinhhhhhhh sdfmsdlkngfsdlkg");
      return FlutterEsimPlatform.instance.onEvent
          .where((EsimInstallResponse? event) => event != null && event.event == "1")
          .timeout(timeout)
          .first;
    } on TimeoutException {
      print("Timeout occurred");
      return null;
    }
  }
}
