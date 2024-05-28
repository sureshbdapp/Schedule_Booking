class ResultModel {
  bool? success;
  Data? data;
  String? message;

  ResultModel({this.success, this.data, this.message});

  ResultModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? otp;
  String? token;

  Data({this.otp, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['token'] = this.token;
    return data;
  }
}
