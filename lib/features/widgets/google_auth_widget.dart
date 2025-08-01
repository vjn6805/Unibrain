import 'package:flutter/material.dart';

import '../../helper/image_string.dart';

class GoogleSignInWidget extends StatelessWidget {
  const GoogleSignInWidget({
    super.key, this.text, this.containerHeight, this.onTap,
  });

  final String? text;
  final double? containerHeight;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: containerHeight,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.greenAccent),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(TImages.googleIcon,height: 30,),
            SizedBox(width: 5),
            Text(text!),
          ],
        ),
      ),
    );
  }
}