import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:schedule/models/ResultModel.dart';

String apiKey = 'fafacb4ff62a439a88f32231bd112ec5';
String baseUrl = "http://18.232.27.198/motus_dev_api/";

class ApiClient {
  static Future<ResultModel?> loginApi(Map<String, String> map) async {
    final uri = Uri.parse("$baseUrl/login/mobile");

    try {
      final apiResponse = await http.post(uri, body: map);
      if (apiResponse.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(apiResponse.body);
        return ResultModel.fromJson(jsonData);
      } else {
        print('Status code: ${apiResponse.statusCode}');
        print('Response body: ${apiResponse.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
    return null;
  }
}

// static Future<List<Results>> apiTrendingDataList() async {
//   final url = Uri.parse("$baseUrl$endpoint?api_key=$apiKey");
//
//   try {
//     final response = await http.get(url);
//
//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       final List<dynamic> resultsData = responseData['results'];
//       final List<Results> resultsList =
//           resultsData.map((data) => Results.fromJson(data)).toList();
//       return resultsList;
//     } else {
//       if (kDebugMode) {
//         print('Request failed with status: ${response.statusCode}');
//       }
//       throw Exception('Failed to load data');
//     }
//   } catch (error) {
//     if (kDebugMode) {
//       print('An error occurred: $error');
//     }
//     throw Exception('Failed to load data');
//   }
// }

// static Future<List<Results>> coverApiImages() async {
//   final url = Uri.parse("$baseUrl$endpoint?api_key=$apiKey");
//   try {
//     final response = await http.get(url);
//     if (response.statusCode == 200) {
//       final responseData = json.decode(response.body);
//       final List<dynamic> resultsData = responseData['results'];
//       final List<Results> apiResultResponse =
//           resultsData.map((data) => Results.fromJson(data)).toList();
//       if (kDebugMode) {
//         print('Poster Path List: $apiResultResponse');
//       }
//
//       return apiResultResponse;
//     } else {
//       if (kDebugMode) {
//         print('Request failed with status: ${response.statusCode}');
//       }
//       return [];
//     }
//   } catch (error) {
//     if (kDebugMode) {
//       print('An error occurred: $error');
//     }
//     return [];
//   }
// }

// //NOW PLAYING RESPONSE
//   static Future<List<String>> nowPlayingResponse() async {
//     final apiUrl = Uri.parse("$baseUrl/movie/now_playing?api_key=$apiKey");
//     final response = await http.get(apiUrl);
//     try {
//       if (response.statusCode == 200) {
//         final apiResponse = jsonDecode(response.body);
//         final List<dynamic> getApiList = apiResponse["results"];
//         final List<Results> responseResult =
//             getApiList.map((e) => Results.fromJson(e)).toList();
//         final List<String> imageUrls =
//             responseResult.map((e) => e.backdropPath ?? "").toList();
//         final List<String> apiImagesUrls = imageUrls
//             .map((path) => 'https://image.tmdb.org/t/p/w500/$path')
//             .toList();
//         return apiImagesUrls;
//       } else {}
//     } catch (error) {
//       print('An error occurred: $error');
//     }
//     return [];
//   }

Future<Map<String, dynamic>> loginApi(Map<String, String> map) async {
  final url = Uri.parse(baseUrl);
  final httpResponse = await http.post(url, body: map);

  try {
    if (httpResponse.statusCode == 200) {
      Map<String, dynamic> apiResponse = jsonDecode(httpResponse.body);
      print('Login successfully');
      return apiResponse;
    }
  } catch (e) {
    print(e);
  }
  return {}; // or return null;
}
