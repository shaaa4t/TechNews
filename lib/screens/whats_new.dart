import 'package:flutter/material.dart';
import 'package:news_app/animations/animations.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/screens/screens.dart';
import 'package:news_app/services/services.dart';
import 'package:news_app/widgets/widgets.dart';

class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
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
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header(),
          SectionTitle(
            title: 'Top Stories',
          ),
          _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    CardStories(
                      onTap: () {
                        Navigator.push(
                            context,
                            SlideRightRoute(
                                page: ShowNewScreen(
                              imageUrl: newsArticles[0].urlToImage,
                              title: newsArticles[0].title,
                              authorName: newsArticles[0].author,
                              publishTime: newsArticles[0].publishedAt,
                              content: newsArticles[0].content,
                              url: newsArticles[0].url,
                            )));
                      },
                      image: newsArticles[0].urlToImage,
                      title: newsArticles[0].title,
                      author: newsArticles[0].author,
                      publish: newsArticles[0].publishedAt,
                    ),
                    CardStories(
                      onTap: () {
                        Navigator.push(
                            context,
                            SlideRightRoute(
                                page: ShowNewScreen(
                              imageUrl: newsArticles[1].urlToImage,
                              title: newsArticles[1].title,
                              authorName: newsArticles[1].author,
                              publishTime: newsArticles[1].publishedAt,
                              content: newsArticles[1].content,
                              url: newsArticles[1].url,
                            )));
                      },
                      image: newsArticles[1].urlToImage,
                      title: newsArticles[1].title,
                      author: newsArticles[1].author,
                      publish: newsArticles[1].publishedAt,
                    ),
                  ],
                ),
          SectionTitle(
            title: 'Recent Updates',
          ),
          _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    CardRecent(
                      imageUrl: newsArticles[3].urlToImage,
                      title: newsArticles[3].title,
                      publishTime: newsArticles[3].publishedAt,
                      onTap: () {
                        Navigator.push(
                            context,
                            SlideRightRoute(
                                page: ShowNewScreen(
                                  imageUrl: newsArticles[3].urlToImage,
                                  title: newsArticles[3].title,
                                  authorName: newsArticles[3].author,
                                  publishTime: newsArticles[3].publishedAt,
                                  content: newsArticles[3].content,
                                  url: newsArticles[3].url,
                                )));
                      },
                    ),
                    CardRecent(
                      onTap: () {
                        Navigator.push(
                            context,
                            SlideRightRoute(
                                page: ShowNewScreen(
                                  imageUrl: newsArticles[4].urlToImage,
                                  title: newsArticles[4].title,
                                  authorName: newsArticles[4].author,
                                  publishTime: newsArticles[4].publishedAt,
                                  content: newsArticles[4].content,
                                  url: newsArticles[4].url,
                                )));
                      },
                      imageUrl: newsArticles[4].urlToImage,
                      title: newsArticles[4].title,
                      publishTime: newsArticles[4].publishedAt,
                    ),
                  ],
                ),

          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
