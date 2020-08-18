import 'package:flutter/material.dart';
import 'package:news_app/animations/animations.dart';
import 'package:news_app/common/commons.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/screens/screens.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widgets/widgets.dart';

class HeadlineNews extends StatefulWidget {
  @override
  _HeadlineNewsState createState() => _HeadlineNewsState();
}

class _HeadlineNewsState extends State<HeadlineNews> {
  List<WallStreetModel> newsArticlesWallStreet = List<WallStreetModel>();
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNewsWallStreet();
  }

  getNewsWallStreet() async {
    WallStreet newsClassWallStreet = WallStreet();
    await newsClassWallStreet.getNews();
    newsArticlesWallStreet = newsClassWallStreet.wallstreet;
    setState(() {
      _loading = false;
    });
  }


  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Headline',
        style: TextStyle(color: Colors.black87),
      ),
      Text(
        'News',
        style: TextStyle(color: ThemeColors.primary),
      ),
    ],
  );

  TextEditingController controller = new TextEditingController();

  List<HeadlineNews> newsArticles = List<HeadlineNews>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.scaffoldBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ThemeColors.scaffoldBackground,
        centerTitle: true,
        actions: [
          IconButton(
              icon: cusIcon,
              onPressed: () {
                setState(() {
                  if (this.cusIcon.icon == Icons.search) {
                    this.cusIcon = Icon(Icons.cancel);
                    this.cusSearchBar = TextField(
                      controller: controller,
                      //onChanged: onSearch,
                      cursorColor: ThemeColors.primary,
                      decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: ThemeColors.primary,
                              )
                          )
                      ),
                      textInputAction: TextInputAction.go,
                      style: TextStyle(
                        color: ThemeColors.primary,
                        fontSize: 16.0,
                      ),
                    );
                  } else {
                    this.cusIcon = Icon(Icons.search);
                    this.cusSearchBar = Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Headline',
                          style: TextStyle(color: Colors.black87),
                        ),
                        Text(
                          'News',
                          style: TextStyle(color: ThemeColors.primary),
                        ),
                      ],
                    );
                  }
                });
              })
        ],
        title: cusSearchBar,
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: newsArticlesWallStreet.length,
        itemBuilder: (context, index) {
          return CardStories(
            onTap: () {
              Navigator.push(
                  context,
                  SlideRightRoute(
                      page: ShowNewScreen(
                        imageUrl: newsArticlesWallStreet[index].urlToImage,
                        title: newsArticlesWallStreet[index].title,
                        authorName: newsArticlesWallStreet[index].author,
                        publishTime:
                        newsArticlesWallStreet[index].publishedAt,
                        content: newsArticlesWallStreet[index].content,
                        url: newsArticlesWallStreet[index].url,
                      )));
            },
            image: newsArticlesWallStreet[index].urlToImage,
            title: newsArticlesWallStreet[index].title,
            author: newsArticlesWallStreet[index].author,
            publish: newsArticlesWallStreet[index].publishedAt,
          );
        },
      ),
    );
  }
}