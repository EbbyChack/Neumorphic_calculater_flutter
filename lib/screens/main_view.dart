import 'package:calculator_flutter_app/components/buttons/ac_btn.dart';
import 'package:calculator_flutter_app/components/calc_screen.dart';
import 'package:calculator_flutter_app/components/buttons/equal_btn.dart';
import 'package:calculator_flutter_app/components/buttons/numb_btn.dart';
import 'package:calculator_flutter_app/components/buttons/operator_btn.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  String equation = '0';
  String result = '0';
  String expression = '';
  bool isBlinking = false;

  void buttonPressed(String s) {
    if (equation.length > 10 && s != 'AC' && s != 'C') {
      blinkFeedback();
      return;
    }

    if (result != "0" && result != 'Error') {
      equation = result;
      result = '0';
    }
    setState(() {
      if (s == "AC") {
        equation = "0";
        result = "0";
      } else if (s == 'C') {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (equation == "0") {
        equation = s;
      } else {
        equation += s;
      }
    });
  }

  void getResult() {
    setState(() {
      expression = equation;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');
      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      } catch (e) {
        result = 'Error';
      }
    });
  }

  void blinkFeedback() async {
    for (int i = 0; i < 2; i++) {
      setState(() {
        isBlinking = true;
      });
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        isBlinking = false;
      });
      await Future.delayed(Duration(milliseconds: 100));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 390;
    bool isMediumScreen = screenWidth > 500;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: isSmallScreen
              ? screenWidth / 12
              : isMediumScreen
                  ? screenWidth / 10
                  : screenWidth / 5,
          bottom: isSmallScreen
              ? screenWidth / 14
              : isMediumScreen
                  ? screenWidth / 12
                  : screenWidth / 7,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 0, 0, 0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          image: DecorationImage(
            image: AssetImage('lib/assets/images/texture.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.fromARGB(83, 186, 186, 186),
              BlendMode.color,
            ),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(1),
          decoration: const BoxDecoration(
            color: Color(0xFF13171C),
            borderRadius: BorderRadius.all(Radius.circular(7)),
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: CalcScreen(equation: equation, result: result, isBlinking: isBlinking)),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ACBtn(
                          text: 'AC',
                          buttonPressed: () => buttonPressed('AC'),
                        ),
                        NumbBtn(
                          text: 'C',
                          buttonPressed: () => buttonPressed('C'),
                        ),
                        OperatorBtn(
                          text: '÷',
                          buttonPressed: () => buttonPressed('÷'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumbBtn(
                          text: '7',
                          buttonPressed: () => buttonPressed('7'),
                        ),
                        NumbBtn(
                          text: '8',
                          buttonPressed: () => buttonPressed('8'),
                        ),
                        NumbBtn(
                          text: '9',
                          buttonPressed: () => buttonPressed('9'),
                        ),
                        OperatorBtn(
                          text: '×',
                          buttonPressed: () => buttonPressed('×'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumbBtn(
                          text: '4',
                          buttonPressed: () => buttonPressed('4'),
                        ),
                        NumbBtn(
                          text: '5',
                          buttonPressed: () => buttonPressed('5'),
                        ),
                        NumbBtn(
                          text: '6',
                          buttonPressed: () => buttonPressed('6'),
                        ),
                        OperatorBtn(
                          text: '-',
                          buttonPressed: () => buttonPressed('-'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumbBtn(
                          text: '1',
                          buttonPressed: () => buttonPressed('1'),
                        ),
                        NumbBtn(
                          text: '2',
                          buttonPressed: () => buttonPressed('2'),
                        ),
                        NumbBtn(
                          text: '3',
                          buttonPressed: () => buttonPressed('3'),
                        ),
                        OperatorBtn(
                          text: '+',
                          buttonPressed: () => buttonPressed('+'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        NumbBtn(
                          text: '0',
                          buttonPressed: () => buttonPressed('0'),
                        ),
                        NumbBtn(text: '.', buttonPressed: () => buttonPressed('.')),
                        EqualBtn(
                          text: '=',
                          buttonPressed: () => getResult(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
