import 'package:flutter/Material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_page.dart';
// import 'caluculator.dart';

// ignore: camel_case_types
class resultpage extends StatelessWidget {
  const resultpage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.inter});
  final String bmiResult;
  final String resultText;
  final String inter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color.fromARGB(15, 0, 0, 0),
        //scaffoldBackgroundColor: Color(0xFFA0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'BMI CALCULATOR',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: const Icon(
            FontAwesomeIcons.backward,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'YOUR RESULT !',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: rcard(
                colour: const Color.fromARGB(15, 0, 0, 0),
                rcardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      bmiResult,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100.0,
                      ),
                    ),
                    Text(
                      inter,
                      style: const TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: inactivecolor,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, MaterialPageRoute(builder: (context) {
                  return const input_page();
                }));
              },
              child: Container(
                color: bottomcolor,
                margin: const EdgeInsets.only(top: 0.0),
                height: 80.0,
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 10.0),
                child: const Center(
                  child: Text(
                    'RE - CALCULATE',
                    style: TextStyle(
                      fontSize: 30.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
