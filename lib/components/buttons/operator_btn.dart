import 'package:flutter/material.dart';

class OperatorBtn extends StatefulWidget {
  final String text;
  final void Function()? buttonPressed;
  const OperatorBtn({super.key, required this.text, required this.buttonPressed});

  @override
  State<OperatorBtn> createState() => _OperatorBtnState();
}

class _OperatorBtnState extends State<OperatorBtn> {
  Color _outerButtonColor = const Color(0xFFF7F3F2);
  final Color _outerOriginalColor = const Color(0xFFF7F3F2);
  final Color _outerPressedColor = const Color.fromARGB(255, 225, 218, 217);

  List<Color> _innerButtonGradient = const [
    Color.fromARGB(255, 231, 223, 220),
    Color.fromARGB(255, 255, 255, 254)
  ];
  final List<Color> _innerOriginalGradient = const [
    Color.fromARGB(255, 231, 223, 220),
    Color.fromARGB(255, 255, 255, 254)
  ];
  final List<Color> _innerPressedGradient = const [
    Color.fromARGB(255, 209, 200, 197),
    Color.fromARGB(255, 235, 235, 234)
  ];

  List<BoxShadow> _innerButtonShadow = [
    BoxShadow(
        color: Color.fromARGB(211, 189, 186, 185),
        spreadRadius: 2,
        blurRadius: 5.0,
        offset: Offset(4, 4)),
    BoxShadow(
        color: Color.fromARGB(255, 255, 255, 255),
        spreadRadius: 2,
        blurRadius: 5.0,
        offset: Offset(-4, -4)),
  ];

  final List<BoxShadow> _innerOriginalShadow = [
    BoxShadow(
        color: Color.fromARGB(211, 189, 186, 185),
        spreadRadius: 2,
        blurRadius: 5.0,
        offset: Offset(4, 4)),
    BoxShadow(
        color: Color.fromARGB(255, 255, 255, 255),
        spreadRadius: 2,
        blurRadius: 5.0,
        offset: Offset(-4, -4)),
  ];

  final List<BoxShadow> _innerPressedShadow = [
    BoxShadow(
        color: Color.fromARGB(211, 189, 186, 185),
        spreadRadius: 2,
        blurRadius: 5.0,
        offset: Offset(4, 4)),
    BoxShadow(
        color: Color.fromARGB(131, 255, 255, 255),
        spreadRadius: 2,
        blurRadius: 5.0,
        offset: Offset(-4, -4)),
  ];

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _innerButtonShadow = _innerPressedShadow;
      _innerButtonGradient = _innerPressedGradient;
      _outerButtonColor = _outerPressedColor;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _innerButtonShadow = _innerOriginalShadow;
      _innerButtonGradient = _innerOriginalGradient;
      _outerButtonColor = _outerOriginalColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;

    double buttonSize = isTablet
        ? MediaQuery.of(context).size.width / 6
        : MediaQuery.of(context).size.width / 4.5;
    return Flexible(
      child: Container(
        height: buttonSize,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(2),
        child: GestureDetector(
          onTapDown: _onTapDown,
          onTapUp: _onTapUp,
          onTap: widget.buttonPressed,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: _outerButtonColor,
            ),
            child: Center(
              child: AnimatedContainer(
                curve: Curves.easeInOut,
                duration: const Duration(milliseconds: 50),
                width: buttonSize - 40,
                height: buttonSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: _innerButtonGradient,
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                  boxShadow: _innerButtonShadow,
                ),
                child: Center(
                  child: Text(
                    widget.text,
                    style: TextStyle(
                        fontSize: buttonSize / 1.5,
                        fontFamily: 'elitedanger',
                        color: Color(0xFFF24C00)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  onPressed() {}
}
