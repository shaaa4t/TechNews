import 'package:flutter/material.dart';

class CardCovid extends StatelessWidget {
  final String title;
  final String count;
  final Color background;
  final Color colorText;

  CardCovid({
    @required this.title,
    @required this.count,
    @required this.background,
    @required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colorText,
              ),
            ),
            Text(
              count,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colorText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
