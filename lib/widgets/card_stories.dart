import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardStories extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String publish;
  final Function onTap;

  CardStories({
    @required this.image,
    @required this.title,
    @required this.author,
    @required this.publish,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    String timeConvert = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(publish));

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.white70,
          height: MediaQuery.of(context).size.height * 0.18,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.25,
                  width: MediaQuery.of(context).size.width*0.25,
                  child: CachedNetworkImage(
                    imageUrl:image,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(author),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.timer),
                              SizedBox(
                                width: 4,
                              ),
                              Text(timeConvert)
                              //Text(publish),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
