import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResponsiveCard extends StatefulWidget {
  final String title;
  final int amount;
  final Color backgroundColor;
  final Duration duration;

  const ResponsiveCard({super.key,
    required this.title,
    required this.amount,
    required this.backgroundColor,
    required this.duration,
  });

  @override
  _ResponsiveCardState createState() => _ResponsiveCardState();
}

class _ResponsiveCardState extends State<ResponsiveCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    _animation = IntTween(begin: 0, end: widget.amount).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return Card(
      color: widget.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Text(
                    _animation.value.toString(),
                    style: TextStyle(
                      fontSize: 36 * textScaleFactor,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 20 * textScaleFactor,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}