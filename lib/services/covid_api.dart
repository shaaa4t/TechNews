import 'dart:convert';

import 'package:http/http.dart' as http;

class Covid{

  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://disease.sh/v3/covid-19/all');
    worldData = json.decode(response.body);
    return worldData;
  }
}