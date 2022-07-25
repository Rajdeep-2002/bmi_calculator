import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/reusablecard_content.dart';
import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  Results(
      {required this.BMIresult,
      required this.resulttext,
      required this.interpretation});
  final String BMIresult;
  final String resulttext;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'RESULTS',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReusableCard(
              color: inactivecard,
              onpress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      resulttext,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Center(
                    child: Text('18.3',
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w900)),
                  ),
                  Center(
                    child: Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return InputPage();
              }));
            },
            child: Container(
              alignment: Alignment.center,
              color: col,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              child: Text('RECALCULATE',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
