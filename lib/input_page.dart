import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'package:bmi_calculator/reusabel_card.dart';
import 'constants.dart';
import 'package:bmi_calculator/results_page.dart';
import 'bottonbutton.dart';
import 'package:bmi_calculator/roundiconbutton.dart';
import 'functionality.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color malecolor = kbottomColor;
  Color femalecolor = kbottomColor;
  int height = 180;
  int weight = 60;
  int age = 20;

  void updatecolor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (malecolor == kbottomColor) {
        malecolor = kcolour;
        femalecolor = kbottomColor;
      } else {
        malecolor = kbottomColor;
      }
    }
    if (selectedGender == Gender.female) {
      if (femalecolor == kbottomColor) {
        femalecolor = kcolour;
        malecolor = kbottomColor;
      } else {
        femalecolor = kbottomColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbottomColor,
      appBar: AppBar(
        backgroundColor: kbottomColor,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updatecolor(Gender.male);
                    });
                  },
                  child: Reusable(
                    colour: malecolor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updatecolor(Gender.female);
                    });
                  },
                  child: Reusable(
                    colour: femalecolor,
                    cardchild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: Reusable(
              colour: kbottomColor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: klabeltextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: knumbertextstyle,
                      ),
                      Text('cm', style: klabeltextstyle),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newvalue) {
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Reusable(
                  colour: kbottomColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: klabeltextstyle,
                      ),
                      Text(
                        weight.toString(),
                        style: knumbertextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconbutton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.00,
                          ),
                          RoundIconbutton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Reusable(
                  colour: kbottomColor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: klabeltextstyle,
                      ),
                      Text(
                        age.toString(),
                        style: knumbertextstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconbutton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.00,
                          ),
                          RoundIconbutton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          gesture(
              onstring: 'CALCULATE',
              ontap: () {
                Functionality fun= Functionality(weight: weight,height: height);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => results(
                    bmiResult:fun.calculatorbmi(),
                    textresult:fun.getresult() ,
                    interpretation:fun.getinter() ,
                  )),
                );
              })
        ],
      ),
    );
  }
}



