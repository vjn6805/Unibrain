import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:unibrain/helper/image_string.dart';

import '../../helper/auth_service.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late String retrievedOtp = '';
  late String email = '';
  late String password = '';
  String enteredOtp = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        GoRouter.of(context).routerDelegate.currentConfiguration.extra
            as Map<String, dynamic>;
    retrievedOtp = args['otp'];
    email = args['email'];
    password = args['pass'];
  }

  void handleOtpVerification() async {
    if (enteredOtp.length != 6 || retrievedOtp != enteredOtp) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter a valid OTP")));
    } else {
      showDialog(
        context: context,
        builder: (_) => CircularProgressIndicator(color: Colors.greenAccent),
        barrierDismissible: true,
      );
      try {
        await AuthService.instance.login(email, password);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("OTP verified Successfully")),
        );
        Navigator.pop(context);
        context.go('/home-screen');
      } catch (e) {
        Navigator.pop(context);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Something went wrong")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: handleOtpVerification,
            child: const Text("Verify OTP"),
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              reverse: true,
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        SizedBox(
                          height: 300,
                          width: 300,
                          child: Image.asset(TImages.loginOtpImg),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "OTP Verification",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: [
                            Text(
                              "Enter the OTP sent to",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              " $email",
                              style: TextStyle(
                                fontSize: 15,

                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        OtpTextField(
                          numberOfFields: 6,
                          borderColor: Colors.green,
                          focusedBorderColor: Colors.greenAccent,
                          showFieldAsBox: true,
                          borderWidth: 3.0,
                          onCodeChanged: (String code) {
                            enteredOtp = code;
                          },
                          onSubmit: (String verificationCode) {
                            setState(() {
                              enteredOtp = verificationCode;
                            });
                          },
                          keyboardType: TextInputType.number,
                          borderRadius: BorderRadius.circular(15),
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          enabled: true,
                          enabledBorderColor: Colors.greenAccent,
                        ),
                        const SizedBox(height: 40),
                        Text("Resend OTP", style: TextStyle(fontSize: 15)),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
