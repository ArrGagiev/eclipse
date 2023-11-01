import 'package:flutter/material.dart';

// Загрузочное пространство
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
