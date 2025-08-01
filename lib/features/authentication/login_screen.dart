import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unibrain/helper/image_string.dart';

import '../widgets/divider_widget.dart';
import '../widgets/google_auth_widget.dart';
import '../widgets/login_signup_toggle_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey formKey = GlobalKey();
  bool obscureText = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///header section
                Image.asset(TImages.appLogo, height: 130, width: 150),
                SizedBox(height: 10),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 10),
                Text(
                  "Login to your account",
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                SizedBox(height: 50),

                ///Form section
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter Email",
                          focusColor: Colors.greenAccent,
                          prefixIcon: Icon(Icons.email),
                        ),
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if(value==null || value.isEmpty){
                            return "Please Enter your email";
                          }
                          if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        obscureText: obscureText,
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: "Enter Password",
                          focusColor: Colors.greenAccent,
                          prefixIcon: Icon(Icons.password),
                          suffixIcon: IconButton(
                            icon: obscureText
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forgot Password?",
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium!.apply(color: Colors.blue),
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
                //Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.apply(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                //divider option
                DividerWidget(thickness: 1,endIndent: 10,middleText: Text("or continue with")),

                SizedBox(height: 20),

                //Google sign in
                GoogleSignInWidget(containerHeight: 50,text: "Sign in with Google",onTap: (){},),

                SizedBox(height: 45,),

                LoginSingupToggleWidget(message: "Don't have an Account?",locationText: "Sign Up",route: '/signup-page',)
              ],
            ),
          ),
        ),
      ),
    );
  }
}






