import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  SectionTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0,bottom: 16.0,left: 24.0),
      child: Text(title,style: TextStyle(color: Colors.grey[700],fontSize: 16),),
    );
  }
}
