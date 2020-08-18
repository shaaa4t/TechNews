import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/models.dart';


class News{
  
  List<NewsModel> news = [];
  
  Future<void> getNews() async {
    String url = "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ecee3c940bfc4e8db98ee324cbe77b0b";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          NewsModel newsModel = NewsModel(
            title: element['title'],
            author: element['author'],
            content: element['content'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            publishedAt: element['publishedAt'],
          );
          news.add(newsModel);
        }
      });
    }
  }
}