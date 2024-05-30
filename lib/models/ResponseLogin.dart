class ResponseLogin {
  String? _otp;
  String? _token;

  ResponseLogin({String? otp, String? token}) {
    if (otp != null) {
      this._otp = otp;
    }
    if (token != null) {
      this._token = token;
    }
  }

  String? get otp => _otp;
  set otp(String? otp) => _otp = otp;
  String? get token => _token;
  set token(String? token) => _token = token;

  ResponseLogin.fromJson(Map<String, dynamic> json) {
    _otp = json['otp'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this._otp;
    data['token'] = this._token;
    return data;
  }
}
