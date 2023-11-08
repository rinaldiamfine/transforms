import 'dart:convert';
import 'package:flutter_alice/alice.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:transforms/features/authentication/models/auth_model.dart';
import 'package:transforms/features/authentication/repositories/auth_repository.dart';
import 'package:transforms/features/authentication/services/auth_service.dart';
import 'package:transforms/tools/configuration.dart';
import 'package:transforms/tools/constant.dart';
import 'package:transforms/tools/enum.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class APIConnection {
  final url = ConfigEnvironments.getEnvironments()['url'];
  final Alice alice;
  final storage = Get.find<GetStorage>();
  APIConnection({required this.alice});

  Map<String, String> setupHeader({String? data}) {
    Map<String, String> headers = {};
    var token = storage.read(StorageConstants.tokenAuthorization);
    // ignore: avoid_print
    print("User Token : $token");
    if (data != null) {
      token = data;
      // ignore: avoid_print
      print("Refresh Token : $token");
    }
    headers['Content-Type'] = 'application/json';
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  Future<void> refreshToken() async {
    final storage = Get.find<GetStorage>();
    final authService = AuthService();
    final authRepository = AuthRepository(authService: authService);
    var profile = authRepository.getUserProfileFromStorage();
    // profile.
    String refreshTokenPrefix = 'token';
    final response = await request(
      endpoint: refreshTokenPrefix, 
      method: RequestMethod.GET,
      dataToken: profile.refreshToken
    );
    if (response.statusCode == 200) {
      var model = RefreshTokenResponseModel.fromJson(jsonDecode(response.body));
      storage.write(
        StorageConstants.tokenAuthorization,
        model.token
      );
    }
  }

  Future<dynamic> request({
    required String endpoint,
    required RequestMethod method,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    String? dataToken,
    bool? isForce
  }) async {
    try {
      http.Response response;
      final urlFormat = p.join(url!, endpoint);
      final Uri uri = Uri.parse(urlFormat);

      switch (method) {
        case RequestMethod.GET:
          response = await http.get(
            uri, 
            headers: setupHeader(
              data: dataToken
            )
          ).timeout(
            Duration(seconds: limitRequestTimeout),
            onTimeout: () {
              return http.Response('Request Timeout', 408); 
            },
          );
          break;
        case RequestMethod.POST:
          response = await http.post(
            uri, 
            body: jsonEncode(body), 
            headers: setupHeader()
          ).timeout(
            Duration(seconds: limitRequestTimeout), 
            onTimeout: () {
              return http.Response('Request Timeout', 408); 
            },
          );
          break;
        case RequestMethod.PATCH:
          response = await http.patch(
            uri, 
            body: jsonEncode(body),
            headers: setupHeader()
          ).timeout(
            Duration(seconds: limitRequestTimeout), 
            onTimeout: () {
              return http.Response('Request Timeout', 408); 
            },
          );
          break;
        case RequestMethod.PUT:
          response = await http.put(
            uri, 
            body: jsonEncode(body), 
            headers: setupHeader()
          ).timeout(
            Duration(seconds: limitRequestTimeout),
            onTimeout: () {
              return http.Response('Request Timeout', 408); 
            },
          );
          break;
        case RequestMethod.DELETE:
          response = await http.delete(
            uri, 
            headers: setupHeader()
          ).timeout(
            Duration(seconds: limitRequestTimeout), 
            onTimeout: () {
              return http.Response('Request Timeout', 408); 
            },
          );
          break;
        case RequestMethod.HEAD:
          response = await http.head(uri).timeout(
            Duration(seconds: limitRequestTimeout),
            onTimeout: () {
              return http.Response('Request Timeout', 408); 
            },
          );
          break;
        default:
          response = await http.get(uri).timeout(
            Duration(seconds: limitRequestTimeout),
            onTimeout: () {
              return http.Response('Request Timeout', 408); 
            },
          );
      }
      if (isDebug) alice.onHttpResponse(response);
      if (response.statusCode == 403 && isForce != true) {
        await refreshToken().then((value) {
          return request(
            endpoint: endpoint,
            method: method,
            body: body,
            headers: headers,
            isForce: true
          );
        });
      }
      return response;
      //// Waiting for the standarization response from BE
      // if (response.statusCode == 200) {
      //   final jsonData = jsonDecode(response.body);
      //   return Future.value(jsonData);
      // } else {
      //   final jsonData = jsonDecode(response.body);
      //   return Future.value(jsonData);
      // }

    } catch (e) {
      rethrow;
    }
  }

}