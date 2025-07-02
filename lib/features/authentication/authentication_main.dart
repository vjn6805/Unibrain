import 'package:flutter/material.dart';
import 'package:unibrain/features/authentication/login_screen.dart';
import 'package:unibrain/helper/helper_functions.dart';


class AuthenticationMain extends StatefulWidget {
  const AuthenticationMain({super.key});

  @override
  State<AuthenticationMain> createState() => _AuthenticationMain();
}

class _AuthenticationMain extends State<AuthenticationMain> {

  final List<bool> _isSelected=[true,false];
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    final bool dark=THelperFunctions.isDarkMode(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(child: SingleChildScrollView(
        child: Padding( 
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: Column(
            children: [

              //header widget
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Center(
                  child: Column(
                    children: [
                      Text("UniBrain",style: Theme.of(context).textTheme.headlineLarge,),
                      SizedBox(height: 8,),
                      Text("Powering Intelligence Together")
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50,),

              //Toggle button - Login/SignUp
              Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow:[
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.3),
                      blurRadius: 1,
                      spreadRadius: 1,
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(15),
                    isSelected: _isSelected,
                    onPressed: (int index) {
                      setState(() {
                        for (int i = 0; i < _isSelected.length; i++) {
                          _isSelected[i] = i == index;
                        }
                        _selectedIndex = index;
                      });
                    },
                    fillColor: Colors.white,
                    selectedColor: Colors.black,
                    color: Colors.black54,
                    renderBorder: false,
                    children: [
                      Container(
                        width: 170,
                        child: Center(
                          child: Text(
                            "Login",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      Container(
                        width: 170,
                        child: Center(
                          child: Text(
                            "Signup",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50,),

              //login-signup ui render
              _selectedIndex==0?LoginScreen():AuthenticationMain(),
            ],
          ),
        ),
      )),
    );
  }
}
