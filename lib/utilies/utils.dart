import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: const Color.fromARGB(255, 255, 73, 12),
        textColor: Colors.black,
        toastLength: Toast.LENGTH_LONG);
  }

  //to show flushbar message  message
  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
        padding: const EdgeInsets.all(14),
        titleColor: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        flushbarPosition: FlushbarPosition.TOP,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 22,
          color: Colors.white54,
        ),
        message: message,
        progressIndicatorBackgroundColor: Colors.black,
        //title: "Hello",
        messageColor: const Color.fromARGB(255, 255, 255, 255),
        duration: const Duration(seconds: 2),
      )..show(context),
    );
  }

  //for login screen(focus function)
  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  //
  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.black,
      ),
    );
  }
}
