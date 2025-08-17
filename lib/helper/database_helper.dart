import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'auth_service.dart';
import 'helper_functions.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();

  DatabaseHelper._();

  Future<void> handleLogin(
    String email,
    String password,
    BuildContext context,
    GlobalKey<FormState> formKey,
  ) async {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (_) => CircularProgressIndicator(color: Colors.greenAccent),
        barrierDismissible: true,
      );
      try {
        //todo: add login check from backend
        await EmailOTP.sendOTP(email: email);
        var temp=EmailOTP.getOTP();
        Navigator.pop(context);
        context.go('/otp-screen',extra: {'otp':temp,'email':email,'pass':password});

      } catch (e) {
        Navigator.pop(context);
        THelperFunctions.showAlert(
          "Error",
          "Invalid Login credentials",
          context,
        );
      }
    }
    else {
      THelperFunctions.showAlert(
        "Error",
        "Please Enter all the Details",
        context,
      );
    }
  }


}
