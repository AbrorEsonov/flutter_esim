class EsimInstallResponse {
  EsimInstallResponse({
    String? event,
    Body? body,
  }) {
    _event = event;
    _body = body;
  }

  EsimInstallResponse.fromJson(dynamic json) {
    _event = json['event'];
    _body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }

  String? _event;
  Body? _body;

  EsimInstallResponse copyWith({
    String? event,
    Body? body,
  }) =>
      EsimInstallResponse(
        event: event ?? _event,
        body: body ?? _body,
      );

  String? get event => _event;

  Body? get body => _body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['event'] = _event;
    if (_body != null) {
      map['body'] = _body?.toJson();
    }
    return map;
  }
}

/// resultCode : 2
/// message : "failed to install ESIM"

class Body {
  Body({
    int? resultCode,
    String? message,
  }) {
    _resultCode = resultCode;
    _message = message;
  }

  Body.fromJson(dynamic json) {
    _resultCode = json['resultCode'];
    _message = json['message'];
  }

  int? _resultCode;
  String? _message;

  Body copyWith({
    int? resultCode,
    String? message,
  }) =>
      Body(
        resultCode: resultCode ?? _resultCode,
        message: message ?? _message,
      );

  int? get resultCode => _resultCode;

  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resultCode'] = _resultCode;
    map['message'] = _message;
    return map;
  }
}
