// ignore_for_file: camel_case_types
// ignore: unused_import
import 'package:bmi_calci/result.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(const bmi_calculator());
}

class bmi_calculator extends StatefulWidget {
  const bmi_calculator({super.key});

  @override
  State<bmi_calculator> createState() => _BMI_CalculatorState();
}

class _BMI_CalculatorState extends State<bmi_calculator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
          home: const input_page(),
          theme: ThemeData.dark().copyWith(
            primaryColor: const Color.fromARGB(15, 0, 0, 0),
            //scaffoldBackgroundColor: Color(0xFFA0E21),
          )),
    );
  }
}
