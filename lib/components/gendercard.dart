import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class GenderCard extends StatelessWidget {
  GenderCard({this.cardIcon, this.cardText});

  final IconData cardIcon;
  final String cardText;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80,
          color: Colors.white,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          cardText,
          style: kTextStyle,
        ),
      ],
    );
  }
}
