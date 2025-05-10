import 'package:flutter/cupertino.dart';

class CongratsButton extends StatelessWidget {
  const CongratsButton({
    super.key,
    required this.buttonText,
    required this.press,
    required this.backgroundColor,
    required this.boarderColor,
    required this.width,
    required this.textColor,
  });

  final String buttonText;
  final VoidCallback press;
  final Color backgroundColor;
  final Color boarderColor;
  final Color textColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: press,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: boarderColor, width: 2),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
