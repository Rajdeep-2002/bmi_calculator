import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const BMIcalculator());
}

class BMIcalculator extends StatelessWidget {
  const BMIcalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(backgroundColor: Color(0xFF000002)),
        scaffoldBackgroundColor: Color(0xFF000002),
      ),
      home: InputPage(),
    );
  }
}
