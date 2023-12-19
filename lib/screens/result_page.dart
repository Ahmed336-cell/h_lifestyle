import 'dart:math';

import 'package:flutter/material.dart';
import 'package:h_lifestyle/constants.dart';
import 'package:h_lifestyle/components/reusable_card.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    required this.bmiResult,
    required this.resultText,
    required this.inter,
  });

  final String bmiResult;
  final String resultText;
  final String inter;

  List<String> generateRandomIngredients() {
    final random = Random();
    final List<String> allIngredients = [
      "Eggs", "Oats", "Banana", "Grilled Chicken", "Quinoa", "Broccoli",
      "Salmon", "Sweet Potato", "Asparagus", "Avocado", "Spinach", "Brown Rice",
      // Add more ingredients as needed
    ];

    final List<String> randomIngredients = [];

    for (int i = 0; i < min(3, allIngredients.length); i++) {
      final randomIndex = random.nextInt(allIngredients.length);
      final ingredient = allIngredients[randomIndex];
      randomIngredients.add(ingredient);
    }

    return randomIngredients;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kTitleStyle.copyWith(fontSize: 30),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: ReusableCard(
                c: activeCardColor,
                cardChilde: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        resultText.toUpperCase(),
                        style: resultTextStyle.copyWith(fontSize: 24),
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: kBMITextStyle.copyWith(fontSize: 60),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        inter,
                        textAlign: TextAlign.center,
                        style: kBodyTextStyle.copyWith(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Diet Recommendations",
                      style: resultTextStyle.copyWith(fontSize: 24),
                    ),
                    SizedBox(height: 20),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DietRecommendationList(
                          mealName: "Breakfast",
                          ingredients: generateRandomIngredients(),
                        ),
                        DietRecommendationList(
                          mealName: "Lunch",
                          ingredients: generateRandomIngredients(),
                        ),
                        DietRecommendationList(
                          mealName: "Dinner",
                          ingredients: generateRandomIngredients(),
                        ),
                      ],
                    )


                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            label: "RE-CALCULATE",
            onPressd: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

class DietRecommendationList extends StatelessWidget {
  final String mealName;
  final List<String> ingredients;

  DietRecommendationList({
    required this.mealName,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$mealName Ingredients:",
          style: labelTextStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var ingredient in ingredients)
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("- $ingredient", style: kBodyTextStyle.copyWith(fontSize: 18)),
              ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
