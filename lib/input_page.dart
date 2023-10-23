import 'package:flutter/material.dart';
import 'result.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:bmi_calci/result.dart';
import 'caluculator.dart';

const inactivecolor = Color.fromARGB(15, 0, 0, 0);
const activecolor = Color.fromARGB(180, 66, 229, 82);
const bottomcolor = Color(0xFFEB1555);
// ignore: constant_identifier_names
const Textcolor = Colors.grey;
int height = 150;
int weight = 50;
int age = 10;

enum Gender {
  male,
  female,
}

// ignore: camel_case_types
class input_page extends StatefulWidget {
  const input_page({super.key});

  @override
  State<input_page> createState() => _input_pageState();
}

// ignore: camel_case_types
class _input_pageState extends State<input_page> {
  Color malecolor = inactivecolor;
  Color femalecolor = inactivecolor;
  void updatecolor(Gender gender) {
    if (gender == Gender.male) {
      if (malecolor == inactivecolor) {
        malecolor = activecolor;
        femalecolor = inactivecolor;
      } else {
        malecolor = inactivecolor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: rcard(
                  rcardChild: GestureDetector(
                    onTap: () {
                      setState(() {
                        updatecolor(Gender.male);
                      });
                    },
                    child: const innercard(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                  ),
                  colour: inactivecolor,
                ),
              ),
              Expanded(
                  child: rcard(
                rcardChild: GestureDetector(
                  onTap: () {
                    setState(() {
                      updatecolor(Gender.female);
                    });
                  },
                  child: const innercard(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
                colour: inactivecolor,
              )),
            ],
          )),
          Expanded(
            child: rcard(
              rcardChild: Column(
                children: <Widget>[
                  const Text(
                    'HEIGHT',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Textcolor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w900,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Textcolor,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: const Color.fromARGB(255, 80, 76, 86),
                    inactiveColor: const Color.fromARGB(255, 241, 242, 242),
                    onChanged: (double newvalue) {
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  ),
                ],
              ),
              colour: inactivecolor,
            ),
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: rcard(
                  rcardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'WEIGHT',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Textcolor,
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style: const TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FloatingActionButton(
                              backgroundColor:
                                  const Color.fromARGB(255, 44, 76, 88),
                              child: const Icon(
                                FontAwesomeIcons.minus,
                                size: 30.0,
                              ),
                              onPressed: () {
                                setState(
                                  () {
                                    weight--;
                                  },
                                );
                              }),
                          FloatingActionButton(
                              backgroundColor:
                                  const Color.fromARGB(255, 44, 76, 88),
                              child: const Icon(
                                // ignore: deprecated_member_use
                                FontAwesomeIcons.add,
                                size: 30.0,
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              }),
                        ],
                      ),
                    ],
                  ),
                  colour: inactivecolor,
                ),
              ),
              Expanded(
                  child: rcard(
                colour: inactivecolor,
                rcardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'AGE',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Textcolor,
                      ),
                    ),
                    Text(
                      age.toString(),
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FloatingActionButton(
                            backgroundColor:
                                const Color.fromARGB(255, 44, 76, 88),
                            child: const Icon(
                              FontAwesomeIcons.minus,
                              size: 30.0,
                            ),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            }),
                        FloatingActionButton(
                            backgroundColor:
                                const Color.fromARGB(255, 44, 76, 88),
                            child: const Icon(
                              // ignore: deprecated_member_use
                              FontAwesomeIcons.add,
                              size: 30.0,
                            ),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              )),
            ],
          )),
          Container(
            margin: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: inactivecolor,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          GestureDetector(
            onTap: () {
              CaluculatorBrain calc =
                  CaluculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return resultpage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  inter: calc.getInterpretation(),
                );
              }));
              //     // calculatorbrain calc =
              //     //     calculatorbrain(height: height, weight: weight);
              //     // Navigator.push(
              //     //   context,
              //     // MaterialPageRoute(
              //     //   builder: (context) => result(
              //           //       bmiResult: calc.CalculateBMI(),
              //           //       resultText: calc.getResult(),
              //           //       inter: calc.getInter(),
              //           // ),
              //     // );
              //     // );
            },
            child: Container(
              color: bottomcolor,
              margin: const EdgeInsets.only(top: 0.0),
              height: 80.0,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 10.0),
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class innercard extends StatelessWidget {
  const innercard({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
      ],
    );
  }
}

// ignore: camel_case_types
class rcard extends StatelessWidget {
  const rcard({super.key, required this.colour, this.rcardChild});
  final Color colour;
  final Widget? rcardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: rcardChild,
    );
  }
}
//Color.fromARGB(15, 62, 103, 162)