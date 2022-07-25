import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusablecard_content.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/BMI_brain.dart';

const col = Color(0XFF06C46C);
const co = Color(0XFF333335);
const inactivecard = co;
const activecard = col;

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactivecard;
  Color femaleCardColor = inactivecard;
  void updateColour(Gender selected) {
    if (selected == Gender.male) {
      if (maleCardColor == inactivecard) {
        maleCardColor = activecard;
        femaleCardColor = inactivecard;
      } else {
        maleCardColor = inactivecard;
      }
    } else if (selected == Gender.female) {
      if (femaleCardColor == inactivecard) {
        femaleCardColor = activecard;
        maleCardColor = inactivecard;
      } else {
        femaleCardColor = inactivecard;
      }
    }
  }

  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('BMI calculator'),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(
                        () {
                          updateColour(Gender.male);
                        },
                      );
                    },
                    color: maleCardColor,
                    cardChild:
                        IconWidget(icon: FontAwesomeIcons.male, label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onpress: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    color: femaleCardColor,
                    cardChild: IconWidget(
                        icon: FontAwesomeIcons.female, label: 'FEMALE'),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                onpress: () {},
                color: inactivecard,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900),
                        ),
                        Text(
                          'cm',
                          style: TextStyle(fontSize: 18.0, color: Colors.white),
                        ),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 54.0,
                      max: 252.0,
                      activeColor: Color(0XFF06C46C),
                      inactiveColor: Colors.white,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onpress: () {},
                      color: co,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT',
                              style: TextStyle(
                                  fontSize: 18.0, color: Colors.white)),
                          Text(
                            weight.toString(),
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                roundbutton(
                                  icon: FontAwesomeIcons.minus,
                                  onpressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                roundbutton(
                                  icon: FontAwesomeIcons.plus,
                                  onpressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onpress: () {},
                      color: co,
                      cardChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              roundbutton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              roundbutton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Calculate calc = Calculate(height: height, weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Results(
                    BMIresult: calc.calculateBMI(),
                    resulttext: calc.getresult(),
                    interpretation: calc.getInterpretation(),
                  );
                }));
              },
              child: Container(
                alignment: Alignment.center,
                color: col,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
                child: Text('CALCULATE',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ));
  }
}

class roundbutton extends StatelessWidget {
  roundbutton({required this.icon, required this.onpressed});
  final IconData icon;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      constraints: BoxConstraints.tightFor(
        height: 46.0,
        width: 46.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0XFF06C46C),
    );
  }
}
