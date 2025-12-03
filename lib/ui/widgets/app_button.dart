import 'package:flutter/material.dart';

/// AppButton - STATELESS
/// Parameters:
///   - text (String): Button label text
///   - onPressed (VoidCallback): Callback when button is pressed
///   - color (Color?): Optional background color
/// States: None
/// Why Stateless: Just a styled button, no internal state needed
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Colors.white,
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 5,
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
