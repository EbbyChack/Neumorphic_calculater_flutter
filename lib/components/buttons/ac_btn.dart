import 'package:flutter/material.dart';

class ACBtn extends StatefulWidget {
  final String text;
    final void Function()? buttonPressed;

  const ACBtn({super.key, required this.text, required this.buttonPressed});

  @override
  State<ACBtn> createState() => _ACBtnState();
}

class _ACBtnState extends State<ACBtn> {
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
      flex: 2,
      child: Container(
        height: buttonSize,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(2),
        child: GestureDetector(
          onTapUp: _onTapUp,
          onTapDown: _onTapDown,
          onTap: widget.buttonPressed,
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: _outerButtonColor,
            ),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 40,
                height: buttonSize / 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
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
                        fontSize: buttonSize / 2,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'elitedanger',
                        color: Color(0xFF272A2E)),
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
