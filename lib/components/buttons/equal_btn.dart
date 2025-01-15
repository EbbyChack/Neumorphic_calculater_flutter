import 'package:flutter/material.dart';

class EqualBtn extends StatefulWidget {
  final String text;
  final void Function()? buttonPressed;
  const EqualBtn({super.key, required this.text, required this.buttonPressed});

  @override
  State<EqualBtn> createState() => _EqualBtnState();
}

class _EqualBtnState extends State<EqualBtn> {
  Color _outerButtonColor = const Color(0xFFF14A00);
  final Color _outerOriginalColor = const Color(0xFFF14A00);
  final Color _outerPressedColor = const Color.fromARGB(255, 227, 70, 3);

  List<Color> _innerButtonGradient = const [
    Color(0xFFF24C00),
    Color(0xFFF14A00)
  ];
  final List<Color> _innerOriginalGradient = const [
    Color(0xFFF24C00),
    Color(0xFFF14A00)
  ];
  final List<Color> _innerPressedGradient = const [
    Color.fromARGB(255, 227, 70, 3),
    Color.fromARGB(255, 230, 69, 0)
  ];

  List<BoxShadow> _innerButtonShadow = [
    BoxShadow(
        color: Color(0xFFD24403),
        spreadRadius: 2,
        blurRadius: 5.0,
        offset: Offset(4, 4)),
    BoxShadow(
        color: Color.fromARGB(47, 255, 255, 255),
        spreadRadius: 2,
        blurRadius: 5.0,
        offset: Offset(-4, -4)),
  ];

  final List<BoxShadow> _innerOriginalShadow = [
    BoxShadow(
        color: Color(0xFFD24403),
        spreadRadius: 2,
        blurRadius: 5.0,
        offset: Offset(4, 4)),
    BoxShadow(
        color: Color.fromARGB(47, 255, 255, 255),
        spreadRadius: 2,
        blurRadius: 5.0,
        offset: Offset(-4, -4)),
  ];

  final List<BoxShadow> _innerPressedShadow = [
    BoxShadow(
        color: Color.fromARGB(255, 194, 64, 4),
        spreadRadius: 2,
        blurRadius: 5.0,
        offset: Offset(4, 4)),
    BoxShadow(
        color: Color.fromARGB(46, 245, 245, 245),
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
      child: AnimatedContainer(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 50),
        height: buttonSize,
        padding: const EdgeInsets.all(0),
        margin: const EdgeInsets.all(2),
        child: GestureDetector(
          onTapUp: _onTapUp,
          onTapDown: _onTapDown,
          onTap: widget.buttonPressed,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: _outerButtonColor,
            ),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 2 - 40,
                height: buttonSize/1.5 ,
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
                        fontSize: buttonSize/2,
                        fontFamily: 'elitedanger',
                        color: Color.fromARGB(255, 255, 255, 255)),
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
