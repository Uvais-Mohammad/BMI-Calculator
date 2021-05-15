import 'package:bmi_calculator/pages/result_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/gendercard.dart';
import 'package:bmi_calculator/components/repeatcard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/mybutton.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/bmi_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  Gender selectedGender;

  int height = 140;
  int weight = 50;
  int age = 20;

  String result;

  void add() {
    setState(() {
      weight++;
    });
  }

  void sub() {
    setState(() {
      weight--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RepeatCard(
                    onPress: () {
                      setState(() {
                        print("Male card pressed");
                        selectedGender = Gender.male;
                      });
                    },
                    cardWidget: GenderCard(
                      cardIcon: FontAwesomeIcons.mars,
                      cardText: 'MALE',
                    ),
                    colour: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: RepeatCard(
                    onPress: () {
                      setState(() {
                        print("Female card pressed");
                        selectedGender = Gender.female;
                      });
                    },
                    cardWidget: GenderCard(
                      cardIcon: FontAwesomeIcons.venus,
                      cardText: 'FEMALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: RepeatCard(
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: kTextStyle,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kLabelStyle,
                      ),
                      Text("cm"),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0XFFFF0066),
                        overlayColor: Color(0X29FF0066)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                      min: 120,
                      max: 250,
                      inactiveColor: Colors.white24,
                    ),
                  )
                ],
              ),
              colour: kInactiveCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: RepeatCard(
                    cardWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Weight',
                            style: kTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: kLabelStyle,
                              ),
                              Text(
                                'kg',
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyButton(
                                icon: CupertinoIcons.minus,
                                function: sub,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              MyButton(
                                icon: CupertinoIcons.add,
                                function: add,
                              ),
                            ],
                          ),
                        ]),
                    colour: kInactiveCardColor,
                  ),
                ),
                Expanded(
                  child: RepeatCard(
                    cardWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kLabelStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              MyButton(
                                icon: CupertinoIcons.minus,
                                function: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              MyButton(
                                icon: CupertinoIcons.add,
                                function: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ]),
                    colour: kInactiveCardColor,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPressed: () {
              BmiBrain bmiBrain = BmiBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: bmiBrain.calculateBMI(),
                    bmiResult: bmiBrain.getResult(),
                    bmiInstruction: bmiBrain.getInstruction(),
                  ),
                ),
              );
            },
            titleText: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
