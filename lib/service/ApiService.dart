import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wiki_app/model/WikiModel.dart';

class APiService {
  Future<WikiModel> fetchWikiDetails() async {
    final response =  await http.get('https://en.wikipedia.org//w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=Sachin+T&gpslimit=10',
        headers: {
          "Accept": "application/json"
        });
    if (response.body.isNotEmpty) {
     return WikiModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get list');
    }
  }
}