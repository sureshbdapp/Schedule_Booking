import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

import '../utils/AlertDailog.dart';
import '../utils/Constant.dart';
import '../utils/PreferenceManager.dart';
import 'LoggingInterceptor.dart';

const String FORGOT_PASSWORD_END = "/api/v1/auth/forgot-password";
const String LOGIN_END = "/login";
const String VERIFY_OTP_END = "/api/v1/auth/verify-otp";
const String RESET_PASSWORD_END = "/api/v1/auth/reset-password";
const String LOGOUT_END = "/api/v1/auth/logout";
const String COMMONDATA_END = "/api/v1/leads/common-data";
const String LEAD_CREATE_STEP1 = "/api/v1/leads/create-step-1";
const String LEAD_UPDATE_STEP1 = "/api/v1/leads/update-step-1";
const String LEAD_CREATE_STEP2 = "/api/v1/leads/create-step-2";
const String GET_CAMPAIGN_END = "/api/v1/search/campaign?search=";
const String GET_PRODUCT_END = "/api/v1/search/products?search=";
const String GET_LEADS_END = "/api/v1/leads/listing?search=";
const String GET_DISCOUNTS_END = "/api/v1/leads/get-discounts?lead_id=";
const String ADD_PRODUCT_END = "/api/v1/leads_cart/add_product";
const String GET_LEAD_PRODUCTS_END = "/api/v1/leads_cart/get_products?lead_id=";
const String APPLY_DISCOUNT_END = "/api/v1/leads_cart/apply_discount?lead_id=";
const String UPDATE_PRODUCT_END = "/api/v1/leads_cart/update_product";
const String DELETE_PRODUCT_END = "/api/v1/leads_cart/delete_product?lead_id=";
const String UPDATE_ACTIVITY_END = "/api/v1/leads/update-lead-activity";
const String LEAD_DETAILS_END = "/api/v1/leads/get-lead-details?lead_id=";
const String DRAFT_LEAD_DETAILS_END =
    "/api/v1/leads/get-draft-details?lead_id=";
const String GET_PROFILE_END = "/api/v1/accounts/profile";
const String REMOVE_DISCOUNT = "/api/v1/leads_cart/remove_discount?lead_id=";
const String SEARCH_CUSTOMER = "/api/v1/search/customers?search=";
const String DASHBOARD_API = "/api/v1/dashboard";

class ApiBaseService {
  static const String BASE_URL = "http://38.242.216.41:8000";

  static late http.Client client;

  ApiBaseService() {
    // client=http.Client();

    client = InterceptedClient.build(interceptors: [
      LoggingInterceptor(),
    ]);
  }

  static getHttpClient() {
    return client;
  }

  Future<http.Response> get(
      {String path = "", bool tokenRequired = false}) async {
    bool isConnected = await checkInternetConnectivity();
    if (!isConnected) {
      showToast('No internet connection');
      throw Exception('No internet connection');
    }
    try {
      final response = await client.get(
        Uri.parse(getBaseURL() + path),
        headers: getHeaders(tokenRequired: tokenRequired),
      );
      return response;
    } catch (error) {
      if (kDebugMode) {
        print("error in api $error");
      }
      final response = await client.get(
        Uri.parse(getBaseURL() + path),
        headers: getHeaders(tokenRequired: tokenRequired),
      );
      return response;
    }
    // final response = await client.get(
    //   Uri.parse(getBaseURL() + path),
    //   headers: getHeaders(tokenRequired: tokenRequired),
    // );
    // return response;
  }

  Future<http.Response> post(
      {String body = "", String path = "", bool tokenRequired = false}) async {
    bool isConnected = await checkInternetConnectivity();
    if (!isConnected) {
      showToast('No internet connection');
      throw Exception('No internet connection');
    }

    try {
      final response = await client.post(
        Uri.parse(getBaseURL() + path),
        body: body,
        headers: getHeaders(tokenRequired: tokenRequired),
      );
      return response;
    } catch (error) {
      final response = await client.post(
        Uri.parse(getBaseURL() + path),
        body: null,
        headers: getHeaders(tokenRequired: tokenRequired),
      );
      return response;
    }
  }

  Future<http.Response> delete(
      {String path = "", bool tokenRequired = false}) async {
    bool isConnected = await checkInternetConnectivity();
    if (!isConnected) {
      showToast('No internet connection');
      throw Exception('No internet connection');
    }

    final response = await client.delete(
      Uri.parse(getBaseURL() + path),
      headers: getHeaders(tokenRequired: tokenRequired),
    );
    return response;
  }

  Future<http.Response> put(
      {String body = "", String path = "", bool tokenRequired = false}) async {
    bool isConnected = await checkInternetConnectivity();
    if (!isConnected) {
      showToast('No internet connection');
      throw Exception('No internet connection');
    }

    final response = await client.put(
      Uri.parse(getBaseURL() + path),
      body: body,
      headers: getHeaders(tokenRequired: tokenRequired),
    );
    return response;
  }

  // Future<http.Response> putImage(
  //     {required File image, String path = ""}) async {
  //   printWrapped('Image Path: $path');
  //   final response = await http.put(
  //     Uri.parse(path),
  //     headers: getImageHeaders(),
  //     body: image.readAsBytesSync(),
  //   );
  //   return response;
  // }

  String getBaseURL() {
    if (kDebugMode) {
      return BASE_URL;
    } else {
      return BASE_URL;
    }
  }

  String getApiEndPoint(String endPoint) {
    return getBaseURL() + endPoint;
  }

  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  String getLeadsEndPoint(String searchKey, int pageNumber, int filterID,
      String fromDate, String toDate) {
    String url = "$GET_LEADS_END$searchKey&page=$pageNumber";
    if (filterID > 0) {
      url = "$url&lead_status_category=$filterID";
    }
    if (fromDate.isNotEmpty) {
      url = "$url&from_date=$fromDate";
    }
    if (toDate.isNotEmpty) {
      url = "$url&to_date=$toDate";
    }

    return url;
  }

  String getApplyDiscountEndPoint(int leadID, int discountID) {
    return "$APPLY_DISCOUNT_END$leadID&discount_id=$discountID";
  }

  String getDeleteProductEndPoint(int leadID, int productID) {
    return "$DELETE_PRODUCT_END$leadID&product_id=$productID";
  }

  String getToken() {
    String cashedToken = "";
    PreferenceManager.getAccessToken().then((value) {
      if (value.isNotEmpty) {
        cashedToken = value;
      }
    });
    return cashedToken;
  }

  Map<String, String> getHeaders({bool tokenRequired = false}) {
    Map<String, String> headers;
    if (tokenRequired) {
      headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $access_token',
      };
    } else {
      headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'accept': 'application/json'
      };
    }

    return headers;
  }

  Map<String, String> getImageHeaders() {
    return <String, String>{'Content-Type': 'image/png'};
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{400}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
