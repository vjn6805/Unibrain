import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unibrain/features/authentication/login_screen.dart';
import 'package:unibrain/features/authentication/otp_screen.dart';
import 'package:unibrain/features/authentication/signup_screen.dart';
import 'package:unibrain/features/home/home_screen.dart';
import 'package:unibrain/helper/auth_service.dart';

final GoRouter appRouter = GoRouter(
    refreshListenable: AuthService.instance,

    redirect: (context,state) async{
        final loggedIn=AuthService.instance.value;
        final loc=state.uri.path;

        final logginIn=loc=='/login-page';
        final verifyingOtp=loc=='/otp-screen';
        final singup=loc=='/signup-page';

        if(!loggedIn && !(logginIn || verifyingOtp || singup)){
            return '/login-page';
        }

        if(logginIn && loggedIn) {
            //TODO: ADD home screen route
        }

        return null;
    },

    routes: [
      GoRoute(path: '/login-page',builder: (_,__)=>LoginScreen()),
        GoRoute(path: '/signup-page',builder: (_,__)=>SignupScreen()),
        GoRoute(path: '/otp-screen',builder: (_,__)=>OtpScreen()),
        GoRoute(path: '/home-screen',builder: (_,__)=>HomeScreen())
        
    ],);
