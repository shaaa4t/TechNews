import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardRecent extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String publishTime;
  final Function onTap;

  CardRecent({
    @required this.imageUrl,
    @required this.title,
    @required this.publishTime,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String timeConvert = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(publishTime));

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          timeConvert,
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
