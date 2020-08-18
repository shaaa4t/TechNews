import 'package:flutter/material.dart';

class ImageNew extends StatelessWidget {
  final String imageUrl;
  ImageNew({@required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
      child: Image.network(
        imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }
}
