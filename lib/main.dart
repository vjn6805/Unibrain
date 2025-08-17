import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:unibrain/app.dart';

void main() {
  //Widgets are initialized properly check
  WidgetsFlutterBinding.ensureInitialized();

  //Email OTP Config
  EmailOTP.config(
    appName: "UniBrain",
    otpLength: 6,
    emailTheme: EmailTheme.v5,
    otpType: OTPType.numeric
  );

  runApp(MyApp());
}
