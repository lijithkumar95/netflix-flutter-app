import 'package:flutter/material.dart';

class TittleWidget extends StatelessWidget {
  const TittleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
