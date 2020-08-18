import 'package:flutter/material.dart';
import 'package:news_app/animations/animations.dart';
import 'package:news_app/screens/screens.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          _listTile(
            title: 'Explore',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          _listTile(
            title: 'Headline News',
            onTap: () {
              Navigator.push(context, SlideRightRoute(page: HeadlineNews()));
            },
          ),
          _listTile(title: 'Settings'),
          _listTile(title: 'Rate app'),
        ],
      ),
    );
  }

  Widget _listTile({title, onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 4),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black87),
        ),
        trailing: Icon(Icons.arrow_right),
        onTap: onTap,
      ),
    );
  }
}
