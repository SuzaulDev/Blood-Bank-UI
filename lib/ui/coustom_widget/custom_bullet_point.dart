import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final String text;

  BulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('\u2022',
            style: TextStyle(
              fontSize: 20,
              height: 1.55,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}