import 'package:mvvm_architecture/data/netwrok/NetworkAPIServices.dart';
import 'package:mvvm_architecture/data/netwrok/baseAPIServices.dart';
import 'package:mvvm_architecture/resource/components/app_url.dart';

class AuthRepository {
  BaseAPIServices _apiServices = NetworkAPIService();
//for login
  Future<dynamic> loginAPI(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostAPIResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  //for signup
  Future<dynamic> registerAPI(dynamic data) async {
    try {
      dynamic;
      var response = await _apiServices.getPostAPIResponse(
          AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
