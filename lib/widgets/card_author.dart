import 'package:flutter/material.dart';
import 'package:news_app/common/commons.dart';
import 'package:news_app/widgets/widgets.dart';

class CardAuthor extends StatelessWidget {
  final String authorName;
  final String publishTime;
  final String textBtn;
  final Function onPressed;

  CardAuthor({
    @required this.authorName,
    @required this.publishTime,
    @required this.textBtn,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8),
      child: Container(
        width: double.infinity,
        color: Colors.white70,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16.0, bottom: 16, right: 8, left: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      authorName,
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        color: Colors.black54,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(publishTime, style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ],
              ),
              FlatButton(
                onPressed: onPressed,
                color: ThemeColors.primary,
                child: Text(
                  textBtn,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
