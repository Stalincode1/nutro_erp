import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:client/config/app_config.dart';
import 'package:client/model/common_response_model.dart';
import 'package:client/model/token_model.dart';
import 'package:client/networking/api_exception.dart';
import 'package:client/service/shared_service.dart';

class ApiBaseHelper {
  final String _baseUrl = AppConfig.baseUrl;
  final Duration timeout = const Duration(seconds: 20);
  Stream<List<int>> convertResponseModelToStream() {
    // Create a CommonResponseModel
    CommonResponseModel responseModel = CommonResponseModel(
      data: null,
      error: true,
      message: "Unable to process at this moment.\nPlease call administrator",
      status: 408,
    );

    // Convert the response model to a JSON string
    String jsonString = jsonEncode(responseModel.toJson());

    // Convert the JSON string to a list of UTF-8 bytes
    List<int> utf8Bytes = utf8.encode(jsonString);

    // Create a stream from the list of bytes
    return Stream.fromIterable([Uint8List.fromList(utf8Bytes)]);
  }

  http.Response commonTimeReposne() {
    return http.Response(
      CommonResponseModel(
        data: null,
        error: true,
        message: "Unable to process at this moment.\nPlease call administrator",
        status: 408,
      ).toJson(),
      408, // Request Timeout response status code
    );
  }

  noInternetConnection() => CommonResponseModel(
        data: null,
        error: true,
        message: "No Internet Connection",
        status: 503,
      ).toMap();
  internalServerError(String? error) => CommonResponseModel(
        data: null,
        error: true,
        message: error ?? "Error",
        status: 500,
      ).toMap();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static Future<bool> checkInternetConnection() async {
    final PingData result = await Ping('170.64.128.138', count: 1).stream.first;
    return result.summary == null
        ? result.error == null
            ? true
            : false
        : false;
  }

  Future<dynamic> get(String url) async {
    // debugPrint('Api Get, url $_baseUrl$url');
    //  var token = await SharedService.getToken();
    TokenModel? token = await SharedService.getToken();
    if (token == null) {
      SharedService.logggedOutWithOutContext();
    }

    Map<String, String> requestHeader = {
      HttpHeaders.authorizationHeader: 'Bearer ${token!.accessToken!}'
    };
    dynamic responseJson;
    try {
      final response = await http
          .get(
              Uri.parse(
                '$_baseUrl$url',
              ),
              headers: requestHeader)
          .timeout(timeout, onTimeout: commonTimeReposne);
      responseJson = _returnResponse(response);
    } on SocketException {
      debugPrint('No net');
      return noInternetConnection();
    } catch (error, s) {
      debugPrint('$error$s');
      return internalServerError("$error");
    }
    // debugPrint('api get recieved!');
    // print("!!!!!!   : ${responseJson.toString()}");
    return responseJson;
  }

  Future<dynamic> getwithoutToken(String url) async {
    // debugPrint('Api Get, url $_baseUrl$url');
    Map<String, String> requestHeader = {};
    dynamic responseJson;
    try {
      final response = await http
          .get(
              Uri.parse(
                '$_baseUrl$url',
              ),
              headers: requestHeader)
          .timeout(timeout, onTimeout: commonTimeReposne);
      responseJson = _returnResponse(response);
    } on SocketException {
      debugPrint('No net');
      return noInternetConnection();
    } catch (error, s) {
      debugPrint('$error$s');
      return internalServerError("$error");
    }
    debugPrint('api get recieved!');
    return responseJson;
  }

  Future<dynamic> getToken(mobileNo) async {
    // debugPrint('Api Get, url $_baseUrl${AppConfig.oauthAPI}');
    Map<String, String> requestHeader = {
      'Content-Type': "application/x-www-form-urlencoded"
    };
    dynamic responseJson;
    try {
      final response = await http.post(
          Uri.parse(
            '$_baseUrl${AppConfig.oauthAPI}',
          ),
          headers: requestHeader,
          //encoding: Encoding.getByName("utf-8"),
          body: {}).timeout(timeout, onTimeout: commonTimeReposne);
      responseJson = _returnResponse(response);
    } on SocketException {
      debugPrint('No net');
      return noInternetConnection();
    } catch (error, s) {
      debugPrint('$error$s');
      return internalServerError("$error");
    }
    debugPrint('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    debugPrint('Api Post, url  $_baseUrl$url');
    //  var token = await SharedService.getToken();
    TokenModel? token = await SharedService.getToken();
    // Map<String, String> requestHeader = {HttpHeaders.authorizationHeader:'Bearer ${token!.accessToken!}'};
    Map<String, String> requestHeader = {
      HttpHeaders.authorizationHeader: 'Bearer ${token!.accessToken!}',
      'Content-Type': 'application/json'
    };
    //   Map<String, String> requestHeader = {};
    //var jsonBody = jsonEncode(body);
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(
              '$_baseUrl$url',
            ),
            headers: requestHeader,
            body: json.encode(body),
          )
          .timeout(timeout, onTimeout: commonTimeReposne);
      responseJson = _returnResponse(response);
    } on SocketException {
      debugPrint('No net');
      return noInternetConnection();
    } catch (error, s) {
      debugPrint('$error$s');
      return internalServerError("$error");
    }
    debugPrint('api post.');
    return responseJson;
  }

  Future<dynamic> postJson(String url, dynamic body) async {
    debugPrint('Api Post, url $url');
    //  var token = await SharedService.getToken();
    TokenModel? token = await SharedService.getToken();
    // Map<String, String> requestHeader = {HttpHeaders.authorizationHeader:'Bearer ${token!.accessToken!}'};
    Map<String, String> requestHeader = {
      HttpHeaders.authorizationHeader: 'Bearer ${token!.accessToken!}',
      'Content-Type': 'application/json'
    };
    //   Map<String, String> requestHeader = {};
    //var jsonBody = jsonEncode(body);
    dynamic responseJson;
    try {
      final response = await http
          .post(
            Uri.parse(
              '$_baseUrl$url',
            ),
            headers: requestHeader,
            body: body,
          )
          .timeout(timeout, onTimeout: commonTimeReposne);
      responseJson = _returnResponse(response);
    } on SocketException {
      debugPrint('No net');
      return noInternetConnection();
    } catch (error, s) {
      debugPrint('$error$s');
      return internalServerError("$error");
    }
    debugPrint('api post.');
    return responseJson;
  }

  Future<dynamic> postWithoutToken(String url, dynamic body) async {
    debugPrint('Api Post, url $url');
    Map<String, String> requestHeader = {'Content-Type': 'application/json'};
    dynamic responseJson;

    try {
      String jsonBody = body is Map ? jsonEncode(body) : body;

      final response = await http
          .post(
            Uri.parse('$_baseUrl$url'),
            headers: requestHeader,
            body: jsonBody,
          )
          .timeout(timeout, onTimeout: commonTimeReposne);

      responseJson = _returnResponse(response);
    } on SocketException {
      debugPrint('No net');
      return noInternetConnection();
    } catch (error, s) {
      debugPrint('$error$s');
      return internalServerError("$error");
    }

    debugPrint('api post.');
    return responseJson;
  }

  Future<dynamic> commonMultipart(String url, dynamic body,
      List<http.MultipartFile> multiparts, String requestType) async {
    TokenModel? token = await SharedService.getToken();
    Map<String, String> requestHeader = {
      HttpHeaders.authorizationHeader: 'Bearer ${token!.accessToken!}'
    };

    dynamic responseJson;
    try {
      http.MultipartRequest request = http.MultipartRequest(
        requestType,
        Uri.parse(
          '$_baseUrl$url',
        ),
      );

      request.headers.addAll(requestHeader);

      if (body != null) {
        Map<String, String> data = Map<String, String>.from(body);
        request.fields.addAll(data);
      } else {
        Map<String, String> data = {};
        request.fields.addAll(data);
      }

      request.files.addAll(multiparts);
      debugPrint(" request.headers::${request.headers}");
      var streamedResponse =
          await request.send().timeout(timeout, onTimeout: () {
        return http.StreamedResponse(
          convertResponseModelToStream(),
          408, // Request Timeout response status code
        );
      });
      var response = await http.Response.fromStream(streamedResponse);
      responseJson = _returnResponse(response);
    } on SocketException {
      debugPrint('No net');
      return noInternetConnection();
    } catch (error, s) {
      debugPrint('$error$s');
      return internalServerError("$error");
    }
    debugPrint('api post.');
    return responseJson;
  }

  Future<dynamic> putMultipart(
      String url, dynamic body, List<http.MultipartFile> multiparts) async {
    return commonMultipart(url, body, multiparts, 'PUT');
  }

  Future<dynamic> postMultipart(
      String url, dynamic body, List<http.MultipartFile> multiparts) async {
    return commonMultipart(url, body, multiparts, 'POST');
  }

  Future<dynamic> put(String url, dynamic body) async {
    debugPrint('Api Put, url $url');
    //  var token = await SharedService.getToken();
    TokenModel? token = await SharedService.getToken();
    // Map<String, String> requestHeader = {HttpHeaders.authorizationHeader:'Bearer ${token!.accessToken!}'};

    Map<String, String> requestHeader = {
      HttpHeaders.authorizationHeader: 'Bearer ${token!.accessToken!}',
      'Content-Type': 'application/json'
    };
    //    Map<String, String> requestHeader = {};
    dynamic responseJson;
    try {
      final response = await http
          .put(
              Uri.parse(
                '$_baseUrl$url',
              ),
              headers: requestHeader,
              body: json.encode(body))
          .timeout(timeout, onTimeout: commonTimeReposne);
      debugPrint('api put.');
      responseJson = _returnResponse(response);
    } on SocketException {
      debugPrint('No net');
      return noInternetConnection();
    } catch (error, s) {
      debugPrint('$error$s');
      return internalServerError("$error");
    }

    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    debugPrint('Api delete, url $_baseUrl$url');
    //  var token = await SharedService.getToken();
    // Map<String, String> requestHeader = {'Authorization': 'Bearer ${token!}'};
    TokenModel? token = await SharedService.getToken();
    Map<String, String> requestHeader = {
      HttpHeaders.authorizationHeader: 'Bearer ${token!.accessToken!}'
    };

    dynamic apiResponse;
    try {
      final response = await http
          .delete(
              Uri.parse(
                '$_baseUrl$url',
              ),
              headers: requestHeader)
          .timeout(timeout, onTimeout: commonTimeReposne);
      apiResponse = _returnResponse(response);
    } on SocketException {
      debugPrint('No net');
      return noInternetConnection();
    } catch (error, s) {
      debugPrint('$error$s');
      return internalServerError("$error");
    }
    debugPrint('api delete.');
    return apiResponse;
  }

  dynamic _returnResponse(http.Response response) {
    // debugPrint("statusCode::${response.statusCode}");
    switch (response.statusCode) {
      case 200:
      case 408:
      case 400:
        if (response.body.isNotEmpty) {
          var responseJson = json.decode(response.body.toString());
          //   debugPrint('Response ::: $responseJson');
          return responseJson;
        }
        break;

      case 401:
      case 403:
        debugPrint(response.body.toString());
        SharedService.logggedOutWithOutContext();
        throw UnauthorisedException(response.body.toString());
      case 500:
      case 202:
        return response.bodyBytes;
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
