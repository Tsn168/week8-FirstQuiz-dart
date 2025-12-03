import 'package:flutter/material.dart';

/// AnswerOption - STATELESS
/// Parameters:
///   - text (String): Answer text to display
///   - isSelected (bool): Whether this option is currently selected
///   - onTap (VoidCallback): Callback when option is tapped
/// States: None
/// Why Stateless: Selection state (isSelected) comes from parent QuestionScreen
class AnswerOption extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue.shade400 : Colors.grey.shade300,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.blue.shade700 : Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
