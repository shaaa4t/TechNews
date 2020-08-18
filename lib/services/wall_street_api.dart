

import 'dart:convert';

import 'package:news_app/models/models.dart';
import 'package:http/http.dart' as http;

class WallStreet{


  List<WallStreetModel> wallstreet = [];

  Future<void> getNews() async {
    String url = "http://newsapi.org/v2/everything?domains=wsj.com&apiKey=ecee3c940bfc4e8db98ee324cbe77b0b";
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData["articles"].forEach((element){
        if(element["author"] != null && element["content"] != null){
          WallStreetModel wallStreetModel = WallStreetModel(
            title: element['title'],
            author: element['author'],
            content: element['content'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            publishedAt: element['publishedAt'],
          );
          wallstreet.add(wallStreetModel);
        }
      });
    }
  }
}