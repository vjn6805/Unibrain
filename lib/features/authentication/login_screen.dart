import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unibrain/helper/image_string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  GlobalKey formKey=GlobalKey();
  bool obscureText=true;
  final emailController=TextEditingController();
  final passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0,left: 20,right: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //header section
                Image.asset(TImages.appLogo,height: 150,width: 150,),
                SizedBox(height: 20,),
                Text("Welcome Back",style: Theme.of(context).textTheme.headlineLarge,),
                SizedBox(height: 10,),
                Text("Login to your account",style: Theme.of(context).textTheme.titleMedium,),

                SizedBox(height: 50,),

                //Form section
                Form(
                  key: formKey,
                    child:Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Enter Email",
                        focusColor: Colors.greenAccent,
                        prefixIcon: Icon(Icons.email)
                      ),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,

                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      obscureText: obscureText,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "Enter Password",
                        focusColor: Colors.greenAccent,
                          prefixIcon: Icon(Icons.password),
                        suffixIcon: IconButton(
                          icon: obscureText?Icon(Icons.visibility_off):Icon(Icons.visibility),
                          onPressed: (){
                            setState(() {
                              obscureText=!obscureText;
                            });
                          },
                        )
                      ),
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot Password?",style: Theme.of(context).textTheme.titleMedium!.apply(color: Colors.blue),),
                      ],
                    ),

                    SizedBox(height: 20,),
                  ],
                ),
                ),
                //Button
                Container(width:double.infinity,child: ElevatedButton(onPressed: (){}, child: Text("Login",style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),))),

                SizedBox(height: 30,),

                //divider option
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        endIndent: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        "or continue with",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]), // Style your text
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey[400],
                        thickness: 1,
                        indent: 10,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20,),

                //Google sign in
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.greenAccent,

                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sign in with Google")
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
