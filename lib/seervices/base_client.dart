import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'app_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int Time_out_duration = 20;
  // GET
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse(baseUrl + api);
   
    try {
      var response =
          await http.get(uri).timeout(Duration(seconds: Time_out_duration));
           
      return _processResponse(response);
    } on SocketException {
      throw FatctdataException('no internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNoRespondException('api not responded in time', uri.toString());
    }
  }

// POST
  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl + api);
    var payload = json.encode(payloadObj);
    try {
      var response = await http
          .post(uri, body: payload)
          .timeout(Duration(seconds: Time_out_duration));
      return _processResponse(response);
    } on SocketException {
      throw FatctdataException('no internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNoRespondException('api not responded in time', uri.toString());
    }
  }

// DELETE
  Future<dynamic> delete(String baseUrl, String api, dynamic) async {
    var uri = Uri.parse(baseUrl + api);

    try {
      var response =
          await http.delete(uri).timeout(Duration(seconds: Time_out_duration));
      return _processResponse(response);
    } on SocketException {
      throw FatctdataException('no internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNoRespondException('api not responded in time', uri.toString());
    }
  }

//patch
  Future<dynamic> patch(String baseUrl, String api, dynamic) async {
    var uri = Uri.parse(baseUrl + api);

    try {
      var response =
          await http.patch(uri).timeout(Duration(seconds: Time_out_duration));
      return _processResponse(response);
    } on SocketException {
      throw FatctdataException('no internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNoRespondException('api not responded in time', uri.toString());
    }
  }
}

dynamic _processResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = utf8.decode(response.bodyBytes);
      return responseJson;
    case 400:
      throw BadRequestException(
          utf8.decode(response.bodyBytes), response.request.url.toString());
    case 401:
    case 403:
      throw UnAuthorizedException(
          utf8.decode(response.bodyBytes), response.request.url.toString());
    case 500:
    default:
      throw FatctdataException('Error occured with code:${response.statusCode}',
          response.request.url.toString());
  }
}
