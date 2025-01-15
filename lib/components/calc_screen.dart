import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  final String equation;
  final String result;
  final bool isBlinking;
  const CalcScreen({super.key, required this.equation, required this.result, required this.isBlinking});

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double fontSize = screenWidth / 6;

    return Container(
        margin: EdgeInsets.all(2),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF404040), Color(0xFF000000)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.only(right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 100),
                  opacity: widget.isBlinking ? 0.0 : 1.0,
                  child: Text(
                    widget.equation,
                    style: TextStyle(
                      color: Color(0xFF15E498),
                      fontSize: fontSize,
                      height: 1,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'elitedanger',
                      shadows: const [
                        Shadow(
                          offset: Offset(0, 0),
                          blurRadius: 5.0,
                          color: Color.fromARGB(230, 21, 228, 152),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  widget.result,
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: fontSize,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    fontFamily: 'elitedanger',
                    shadows: const [
                      Shadow(
                        offset: Offset(0, 0),
                        blurRadius: 5.0,
                        color: Color.fromARGB(248, 255, 255, 255),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
