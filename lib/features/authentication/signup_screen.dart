import 'package:flutter/material.dart';
import 'package:unibrain/features/widgets/divider_widget.dart';
import 'package:unibrain/features/widgets/google_auth_widget.dart';
import 'package:unibrain/features/widgets/login_signup_toggle_widget.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  ///controllers
  GlobalKey formKey = GlobalKey();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool obscureText1=true;
  bool obsureText2=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Header Section
                SizedBox(height: 10),
                Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 10),
                Text(
                  "Move into the world of Generative AI",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 20),

                ///Form Section
                Form(
                  key: formKey,
                  child: Column(children: [

                    // first name
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "First Name",
                        focusColor: Colors.greenAccent,
                        prefixIcon: Icon(Icons.person_2_rounded),
                      ),
                      controller: firstNameController,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 20),

                    //last name
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        focusColor: Colors.greenAccent,
                        prefixIcon: Icon(Icons.person_2_rounded),
                      ),
                      controller: lastNameController,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(height: 20),

                    //email
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Email Address",
                        focusColor: Colors.greenAccent,
                        prefixIcon: Icon(Icons.email_rounded),
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

                    //password
                    TextFormField(
                      obscureText: obscureText1,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        focusColor: Colors.greenAccent,
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: obscureText1
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              obscureText1 = !obscureText1;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter your password";
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      }
                    ),
                    SizedBox(height: 20),

                    TextFormField(
                      obscureText: obsureText2,
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter your password";
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Confirm Password",
                        focusColor: Colors.greenAccent,
                        prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: obsureText2
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              obsureText2 = !obsureText2;
                            });
                          },
                        ),
                      ),
                    ),
                  ]),
                ),

                SizedBox(height: 20,),

                ///button sign up
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.apply(color: Colors.white),
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                ///divider
                DividerWidget(endIndent: 10,thickness: 1,middleText: Text("or continue with"),),
                SizedBox(height: 20,),

                ///singup with google
                GoogleSignInWidget(containerHeight: 50,text: "Sign Up with Google",onTap: (){},),

                SizedBox(height: 45,),

                ///toggle text
                LoginSingupToggleWidget(message: "Already have an Account?",locationText: "Login",route: '/login-page',)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
