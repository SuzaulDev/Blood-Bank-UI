import 'package:flutter/material.dart';

class AvailabilityWidget extends StatelessWidget {
  final bool isAvailable;

  const AvailabilityWidget({Key? key, required this.isAvailable}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 2,color:isAvailable ? Colors.green : Colors.red, ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isAvailable ? 'AVAILABLE' : 'NOT AVAILABLE',
        style: TextStyle(
          color: isAvailable ? Colors.green : Colors.red,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}