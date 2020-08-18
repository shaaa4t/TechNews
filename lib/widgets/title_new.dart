import 'package:flutter/material.dart';

class TitleNew extends StatelessWidget {
  final String title;
  TitleNew({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0),
      child: Container(
        width: double.infinity,
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.only(top:16.0,bottom: 16,right: 8,left: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
