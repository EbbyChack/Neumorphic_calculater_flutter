import 'package:flutter/material.dart';

class NumbBtn extends StatefulWidget {
  final String text;
  final void Function()? buttonPressed;
  const NumbBtn({super.key, required this.text, required this.buttonPressed});

  @override
  State<NumbBtn> createState() => _NumbBtnState();
}

class _NumbBtnState extends State<NumbBtn> {
  Color _buttonColor = const Color(0xFFF7F3F2);
  final Color _originalColor = const Color(0xFFF7F3F2);
  final Color _pressedColor = const Color.fromARGB(255, 225, 218, 217);

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _buttonColor = _pressedColor;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _buttonColor = _originalColor;
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
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 50),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              color: _buttonColor,
            ),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 7.5,
                  fontFamily: 'elitedanger',
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF272A2E),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
