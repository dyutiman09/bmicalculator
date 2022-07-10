import 'package:bmi_calculator/bottonbutton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusabel_card.dart';
import 'package:flutter/material.dart';

class results extends StatelessWidget {

  results({@required this.bmiResult,@required this.textresult,@required this.interpretation});

  final String bmiResult;
  final String textresult;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Your Result',
                  style: knumbertextstyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Reusable(
              colour: kbottomColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    textresult.toUpperCase(),
                    style: kresulttextstyle,
                  ),
                  Text(
                    bmiResult,
                    style: kbmistyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kbodytextstyle,
                  ),
                ],
              ),
            ),
          ),
          gesture(
            onstring: 'Recalculate',
            ontap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
