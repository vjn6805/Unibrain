import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginSingupToggleWidget extends StatelessWidget {
  const LoginSingupToggleWidget({
    super.key, this.message, this.route, this.locationText,
  });

  final String? message;
  final String? route;
  final String? locationText;


  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(
        children: [
          TextSpan(
            text: message,
          ),
          WidgetSpan(child: SizedBox(width: 6,)),
          WidgetSpan(child: GestureDetector(onTap:()=>context.go(route!),child: Text(
              locationText!,
              style: TextStyle(
                color: Colors.blue,
              )
          ),))

        ]
    ));
  }
}