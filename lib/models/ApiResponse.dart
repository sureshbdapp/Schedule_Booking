class ApiResponse<T> {
  bool? success;
  T? data;
  String? message;

  ApiResponse({this.success, this.data, this.message});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? (json['data']) : null;
    message = json['message'];
  }

  ApiResponse.fromJSON(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) create) {
    success = json['success'];
    data = json['data'] != null ? create(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map['success'] = success;
    if (data != null) {
      map['data'] = (data as dynamic).toJson();
    }
    map['message'] = message;
    return map;
  }
}

// class DefaultResponse {
//   bool? success;
//   Data? data;
//   String? message;
//
//   DefaultResponse({this.success, this.data, this.message});
//
//   DefaultResponse.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['success'] = this.success;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }
