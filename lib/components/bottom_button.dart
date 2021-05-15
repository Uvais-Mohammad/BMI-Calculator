import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onPressed, @required this.titleText});

  final Function onPressed;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: Color(0XFFFF0066),
        child: Center(
          child: Text(
            titleText,
            style: kButtonTextStyle,
          ),
        ),
        width: double.infinity,
        height: kBottomButtonHeight,
      ),
    );
  }
}
