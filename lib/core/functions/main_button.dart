import 'package:flutter/material.dart';

class Main_Button extends StatelessWidget {
  const Main_Button({
    super.key,
    required this.text,
    this.onPressed,
    required this.button_color,
    required this.Button_style,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color button_color;
  final TextStyle? Button_style;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.07,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: button_color,
          disabledBackgroundColor: button_color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 24),
            Text(text, style: Button_style),
          ],
        ),
      ),
    );
  }
}
