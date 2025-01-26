import 'package:flutter/material.dart';

class TodoElevatedButton extends StatelessWidget {
  const TodoElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.green),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
