import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:qrfinal/data/app_exceptions.dart';
import 'package:qrfinal/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  dynamic responseJson;

  // Default headers
  Map<String, String> defaultHeaders = {
    'Content-Type': 'application/json',
    'x-api-key': 'reqres-free-v1',
  };

  Future<dynamic> getapi(String url, {Map<String, String>? headers}) async {
    if (kDebugMode) {
      log("url: $url");
    }

    try {
      final response = await http
          .get(Uri.parse(url), headers: headers ?? defaultHeaders)
          .timeout(const Duration(seconds: 10));

      responseJson = returnresponse(response);
    } on SocketException {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } on HttpException {
      throw ServerException();
    }

    return responseJson;
  }

  Future<dynamic> postapi(var data, String url,
      {Map<String, String>? headers}) async {
    if (kDebugMode) {
      log("url: $url");
      log("data: $data");
    }

    try {
      final response = await http
          .post(Uri.parse(url),
          body: jsonEncode(data), headers: headers ?? defaultHeaders)
          .timeout(const Duration(seconds: 10));

      responseJson = returnresponse(response);
    } on SocketException {
      throw InternetException();
    } on TimeoutException {
      throw RequestTimeOutException();
    } on HttpException {
      throw ServerException();
    }

    return responseJson;
  }

  dynamic returnresponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            "Error occured while communicating with server with status code ${response.statusCode}");
    }
  }
}
