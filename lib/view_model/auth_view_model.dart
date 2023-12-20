import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture/repository/auth_repository.dart';
import 'package:mvvm_architecture/utilies/routes/routes_name.dart';
import 'package:mvvm_architecture/utilies/utils.dart';

class AuthViewModel with ChangeNotifier {
  //
  final _myRepository = AuthRepository();
  //for login loading
  bool _laoding = false;
  bool get loading => _laoding;
  setLoading(bool value) {
    _laoding = value;
    notifyListeners();
  }

  //for signup loading
  bool _signupLoading = false;
  bool get signupLoadin => _signupLoading;
  setSignUpLoading(bool value) {
    _signupLoading = value;
    notifyListeners();
  }

  //login  function
  Future<void> loginAPI(BuildContext context, dynamic data) async {
    setLoading(true);
    _myRepository.loginAPI(data).then((value) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage("Successfully Loggedin", context);
        //navigating to  the home page if the condition meets
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  //signup function
  Future<void> signUpAPI(BuildContext context, dynamic data) async {
    setSignUpLoading(true);
    _myRepository.signupAPI(data).then((value) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage("Successfully Signup", context);
        //navigating to the home page if the condition matched
        Navigator.pushNamed(context, RoutesName.home);
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
