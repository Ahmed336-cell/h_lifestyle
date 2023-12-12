import 'package:h_lifestyle/constants.dart';
import 'package:flutter/material.dart';
import 'package:h_lifestyle/components/reusable_card.dart';
import '../components/bottom_button.dart';
class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult,required this.resultText,required this.inter});

  final String bmiResult;
  final String resultText;
  final String inter;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text("Your Result" ,style: kTitleStyle,),
              )
          ),
          Expanded(
            flex: 5,
            child:ReusableCard(c: activeCardColor,
              cardChilde:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText.toUpperCase() , style: resultTextStyle,),
                  Text(bmiResult,style: kBMITextStyle,),
                  Text(inter,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,)
                ],
              ) ,
            )
            , ),
          BottomButton(label: "RE-CALCULATE", onPressd: (){
            Navigator.pop(context);
          })
        ],
      ),
    );
  }

}