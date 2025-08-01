import 'package:flutter/material.dart';


class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key, this.middleText, this.thickness, this.endIndent,
  });

  final double? thickness;
  final double? endIndent;
  final Text? middleText;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey[400],
            thickness: thickness,
            endIndent: endIndent,
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: middleText
        ),
        Expanded(
          child: Divider(
            color: Colors.grey[400],
            thickness: thickness,
            indent: endIndent,
          ),
        ),
      ],
    );
  }
}