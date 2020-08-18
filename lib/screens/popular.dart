import 'package:flutter/material.dart';
import 'package:news_app/animations/animations.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/screens/screens.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widgets/widgets.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  List<NewsModel> newsArticles = List<NewsModel>();
  bool _loading = true;


  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    newsArticles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: newsArticles.length,
            itemBuilder: (context, index) {
              return CardStories(
                onTap: () {
                  Navigator.push(
                      context, SlideRightRoute(page: ShowNewScreen(
                    imageUrl: newsArticles[index].urlToImage,
                    title: newsArticles[index].title,
                    authorName: newsArticles[index].author,
                    publishTime: newsArticles[index].publishedAt,
                    content: newsArticles[index].content,
                    url: newsArticles[index].url,
                  )));
                },
                image: newsArticles[index].urlToImage,
                title: newsArticles[index].title,
                author: newsArticles[index].author,
                publish: newsArticles[index].publishedAt,
              );
            },
          );
  }
}