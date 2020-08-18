import 'package:flutter/material.dart';

class ContentNew extends StatelessWidget {
  final String content;
  ContentNew({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8),
      child: Container(
        width: double.infinity,
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.only(top:16.0,bottom: 16,right: 8,left: 8),
          child: Text(content,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
