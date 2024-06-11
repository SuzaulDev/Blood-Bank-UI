import 'package:flutter/material.dart';

class StatusWidget extends StatelessWidget {
  final String status;

  const StatusWidget({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    String text;

    switch (status) {
      case 'PENDING':
        bgColor = Colors.orange;
        text = 'PENDING';
        break;
      case 'ACCEPTED':
        bgColor = Colors.blueAccent;
        text = 'ACCEPTED';
        break;
      case 'PROCESSING':
        bgColor = Colors.pinkAccent;
        text = 'PROCESSING';
        break;
      case 'COMPLETE':
        bgColor = Colors.green;
        text = 'COMPLETE';
        break;
      case 'REJECTED':
        bgColor = Colors.red;
        text = 'REJECTED';
        break;
      case 'ACTIVE':
        bgColor = Colors.green;
        text = 'ACTIVE';
        break;
      case 'INACTIVE':
        bgColor = Colors.red;
        text = 'INACTIVE';
        break;
      default:
        bgColor = Colors.grey;
        text = 'UNKNOWN';
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      decoration: BoxDecoration(
        border: Border.all(width: 2,color:bgColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: bgColor,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }
}