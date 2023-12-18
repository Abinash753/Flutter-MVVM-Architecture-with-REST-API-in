import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:mvvm_architecture/data/app_exception.dart';
import 'package:mvvm_architecture/data/netwrok/baseAPIServices.dart';

class NetworkAPIService extends BaseAPIServices {
  @override
  //get method to get  GETResonse from API
  Future getGetAPIResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse("uri")).timeout(const Duration(seconds: 8));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  //post method to get  post response to  API
  @override
  Future getPostAPIResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 12));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No internet connection");
    }
    return responseJson;
  }

  // functio to return the exception error when it occured  in the system
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error occured while communicating with server" +
                "with status code:" +
                response.statusCode.toString());
    }
  }
}
