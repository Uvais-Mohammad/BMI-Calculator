import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/inputpage.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/repeatcard.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.bmi,
      @required this.bmiResult,
      @required this.bmiInstruction});

  final String bmi;
  final String bmiResult;
  final String bmiInstruction;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text(
                "Your Result",
                style: kResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: RepeatCard(
              colour: kInactiveCardColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmiResult,
                    style: kResultTypeText,
                  ),
                  Text(
                    bmi,
                    style: kAnswerText,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      bmiResult,
                      textAlign: TextAlign.center,
                      style: kInstructionText,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputPage(),
                  ),
                );
              },
              titleText: 'RECALCULATE')
        ],
      ),
    );
  }
}
