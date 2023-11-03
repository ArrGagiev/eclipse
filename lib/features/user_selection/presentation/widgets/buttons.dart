import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  const SelectionButton({super.key, this.onPressed, required this.icon});
  final Function? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ElevatedButton(
        onPressed: () => onPressed != null ? onPressed!() : null,
        child: Icon(icon),
      ),
    );
  }
}

class SimpleButton extends StatelessWidget {
  const SimpleButton({super.key, this.onPressed, required this.text});
  final Function? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed != null ? onPressed!() : null,
      child: Text(text),
    );
  }
}
