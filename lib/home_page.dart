import 'package:calculator_app/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuesion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 214, 180),
      body: Column(
        children: [
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuesion,
                      style: TextStyle(fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.centerRight,
                    child: Text(userAnswer, style: TextStyle(fontSize: 30)))
              ],
            ),
          )),
          Expanded(
              flex: 2,
              child: Container(
                // child: MyButton(
                //   buttonColor: const Color.fromARGB(255, 38, 38, 38),
                //   textColor: Colors.deepOrange,
                //   buttonText: '0',
                // ),
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButton(
                        buttonColor: Colors.white,
                        textColor: const Color.fromARGB(255, 38, 38, 38),
                        buttonText: buttons[index],
                        buttonTapped: () {
                          setState(() {
                            userQuesion = '';
                            userAnswer = '';
                          });
                        },
                      );
                    } else if (index == 1) {
                      return MyButton(
                        buttonColor: Colors.white,
                        textColor: const Color.fromARGB(255, 38, 38, 38),
                        buttonText: buttons[index],
                        buttonTapped: () {
                          setState(() {
                            userQuesion = userQuesion.substring(
                                0, userQuesion.length - 1);
                          });
                        },
                      );
                    } else if (index == buttons.length - 1) {
                      return MyButton(
                        buttonColor: Colors.white,
                        textColor: const Color.fromARGB(255, 38, 38, 38),
                        buttonText: buttons[index],
                        buttonTapped: () {
                          setState(() {
                            equalPressed();
                          });
                        },
                      );
                    } else {
                      return MyButton(
                        buttonColor: isOperator(buttons[index])
                            ? Colors.deepOrange
                            : const Color.fromARGB(255, 38, 38, 38),
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.deepOrange,
                        buttonText: buttons[index],
                        buttonTapped: () {
                          setState(() {
                            userQuesion += buttons[index];
                          });
                        },
                      );
                    }
                  },
                ),
              ))
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = userQuesion;
    finalQuestion = finalQuestion.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);

    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
