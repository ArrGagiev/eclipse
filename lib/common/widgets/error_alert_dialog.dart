import 'package:eclipse/features/user_selection/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog({
    super.key,
    this.onPressed,
    required this.title,
    required this.content,
  });

  final Function? onPressed;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      title: Text(title),
      content: Text(content),
      actions: [
        SimpleButton(
          text: 'Повторить попытку',
          onPressed: () => onPressed != null ? onPressed!() : null,
        )
      ],
    );
  }
}
