import 'package:flutter/material.dart';

void showLoginSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Login Successful'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 60,
            ),
            SizedBox(height: 20),
            Text('You have successfully logged in!'),
          ],
        ),
        actions: [
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              // Navigate to another page if needed
            },
          ),
        ],
      );
    },
  );
}

void showLoginFailedDialog({required BuildContext context,required String msg}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Login Failed'),
        content:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 20),
            Text(msg),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Retry'),
            onPressed: () {
              Navigator.of(context).pop();
              // Trigger login retry if needed
            },
          ),
        ],
      );
    },
  );
}

