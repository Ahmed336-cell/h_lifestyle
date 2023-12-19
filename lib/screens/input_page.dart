import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import 'package:h_lifestyle/components/reusable_card.dart';
import '../constants.dart';
import '../recipe.dart';
import 'result_page.dart';
import '../components/bottom_button.dart';
import '../components/round_button.dart';
import 'package:h_lifestyle/calculator_brain.dart';
import 'package:http/http.dart' as http;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}
enum ActivityLevel {
  littleNoExercise,
  lightExercise,
  moderateExercise,
  veryActive,
  extraActive,
}

enum WeightLossPlan {
  maintainWeight,
  mildWeightLoss,
  weightLoss,
  extremeWeightLoss,
}

class _InputPageState extends State<InputPage> {
  Gender? genderSelected;
  int height = 180;
  int weight = 60;
  int age = 20;
  ActivityLevel? activityLevel;
  WeightLossPlan? weightLossPlan;
  int mealsPerDay = 3; // Default value






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ReusableCard(
                      c: genderSelected == Gender.male
                          ? activeCardColor
                          : inActiveCardColor,
                      cardChilde: ReusableColumn(
                          FontAwesomeIcons.mars, "MALE"),
                      onPress: () {
                        setState(() {
                          genderSelected = Gender.male;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      c: genderSelected == Gender.female
                          ? activeCardColor
                          : inActiveCardColor,
                      cardChilde: ReusableColumn(
                          FontAwesomeIcons.venus, "FEMALE"),
                      onPress: () {
                        setState(() {
                          genderSelected = Gender.female;
                        });
                      },
                    ),
                  ),
                ],
              ),
              ReusableCard(
                c: activeCardColor,
                cardChilde: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HEIGHT",
                      style: labelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: numberTextStyle,
                        ),
                        Text("cm", style: labelTextStyle)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 15),
                        overlayShape: RoundSliderOverlayShape(
                            overlayRadius: 25),
                        activeTrackColor: Colors.white,
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        thumbColor: Color(0xFFEB1555),
                        activeColor: Colors.white,
                        inactiveColor: Color(0xFF8D8E98),
                        overlayColor:
                        MaterialStateProperty.all<Color>(
                            Color(0x29EB1555)),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      c: activeCardColor,
                      cardChilde: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("WEIGHT", style: labelTextStyle),
                          Text("$weight", style: numberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      c: activeCardColor,
                      cardChilde: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE", style: labelTextStyle),
                          Text("$age", style: numberTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPress: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              SizedBox(
                                width: 10,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ReusableCard(
                c: activeCardColor,
                cardChilde: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ACTIVITY LEVEL", style: labelTextStyle),
                    Column(
                      children: ActivityLevel.values.map((level) {
                        return Container(
                          height: 50,
                          child: RadioListTile<ActivityLevel>(
                            title: Text(level.toString().split('.').last),
                            value: level,
                            groupValue: activityLevel,
                            onChanged: (value) {
                              setState(() {
                                activityLevel = value;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              ReusableCard(
                c: activeCardColor,
                cardChilde: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT LOSS PLAN", style: labelTextStyle),
                    Column(
                      children: WeightLossPlan.values.map((plan) {
                        return Container(
                          height: 50,
                          child: RadioListTile<WeightLossPlan>(
                            title: Text(plan.toString().split('.').last),
                            value: plan,
                            groupValue: weightLossPlan,
                            onChanged: (value) {
                              setState(() {
                                weightLossPlan = value;
                              });
                            },
                          ),
                        );
                      }).toList(),
                    ),                  ],
                ),
              ),
              ReusableCard(
                c: activeCardColor,
                cardChilde: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("MEALS PER DAY", style: labelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [3, 4, 5].map((meals) {
                        return Row(
                          children: [
                            Radio<int>(
                              value: meals,
                              groupValue: mealsPerDay,
                              onChanged: (value) {
                                setState(() {
                                  mealsPerDay = value!;
                                });
                              },
                            ),
                            Text("$meals"),
                          ],
                        );
                      }).toList(),
                    ),                  ],
                ),
              ),
              BottomButton(
                label: "CALCULATE",
                onPressd: () {
                  CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        inter: calc.getInterpretaion(),
                      ),
                    ),
                  );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}