// import 'package:dio/dio.dart';
//
// import '../utils/AlertDailog.dart';
// import '../utils/AppDelegate.dart';
// import '../utils/PreferenceManager.dart';
//
// class LoggingInterceptor extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     print('REQUEST[${options.method}] => PATH: ${options.path}');
//     print('REQUEST HEADERS: ${options.headers}');
//     print('REQUEST BODY: ${options.data}');
//     super.onRequest(options, handler);
//   }
//
//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) {
//     print('RESPONSE[${response.statusCode}] => DATA: ${response.data}');
//     super.onResponse(response, handler);
//   }
//
//   @override
//   void onError(DioError err, ErrorInterceptorHandler handler) {
//     print('ERROR[${err.response?.statusCode}] => MESSAGE: ${err.message}');
//
//     if (err.response?.statusCode == 401) {
//       showToast("Your session is expired, please login again.");
//       // access_token = "";
//       PreferenceManager.clearSharedPref();
//       AppDelegate().reset();
//       // }
//       // Handle 401 Unauthorized
//       print('Unauthorized request - Handle accordingly');
//     } else if (err.response?.statusCode == 502) {
//       // Handle 502 Bad Gateway
//       print('Bad Gateway - Handle accordingly');
//     }
//
//     super.onError(err, handler);
//   }
// }
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:schedule/screens/SplashScreen.dart';

import '../main.dart';
import '../utils/AlertDailog.dart';
import '../utils/AppDelegate.dart';
import '../utils/PreferenceManager.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print(data.toString());
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    if (data.statusCode == 401) {
      if (NavigationService.navigatorKey.currentContext != null) {
        showToast("Your session is expired, please login again.");
        // access_token = "";
        PreferenceManager.clearSharedPref();
        AppDelegate().reset();
        Navigator.pushAndRemoveUntil<dynamic>(
          NavigationService.navigatorKey.currentContext!,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => const SplashScreen(),
          ),
          (route) => false,
        );
      }
    }
    if (data.statusCode == 502) {
      // showToast('Bad Gateway');
    }
    if (kDebugMode) {
      log(data.toString());
    }
    return data;
  }

  Future<ResponseData> retryOriginalRequest(RequestData originalRequest) async {
    // Implement the logic to retry the original request with the new token
    // try {
    final retriedResponse = await originalRequest.body();

    return retriedResponse;
    //  } catch (e) {

    // Handle retry error
    // return ResponseData(
    //   statusCode: 500,
    //   headers: {},
    //   body: null,
    // );
    // }

    // @override
    // Future<BaseRequest> interceptRequest({
    //   required BaseRequest request,
    // }) async {
    //   print('----- Request -----');
    //   print(request.toString());
    //   print(request.headers.toString());
    //   return request;
    // }
    //
    // @override
    // Future<BaseResponse> interceptResponse({
    //   required BaseResponse response,
    // }) async {
    //   log('----- Response -----');
    //   log('Code: ${response.statusCode}');
    //   if (response is Response) {
    //     log((response).body);
    //   }
    //   return response;
    // }
    //
    // @override
    // Future<bool> shouldInterceptRequest() {
    //   // TODO: implement shouldInterceptRequest
    //   throw UnimplementedError();
    // }
    //
    // @override
    // Future<bool> shouldInterceptResponse() {
    //   // TODO: implement shouldInterceptResponse
    //   throw UnimplementedError();
    // }
  }
}
