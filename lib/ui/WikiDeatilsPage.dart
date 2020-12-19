import 'package:flutter/material.dart';
import 'package:wiki_app/Components/WikiItemCard.dart';
import 'package:wiki_app/model/WikiModel.dart';
import 'package:wiki_app/service/ApiService.dart';

class WikiListPage extends StatefulWidget {
  WikiListPage() : super();
  @override
  WikiListPageState createState() => WikiListPageState();
}

class WikiListPageState extends State<WikiListPage> {
  double width;
  double height;
  APiService apiService = new APiService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details page'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[

        ],
      ),
    );
  }
}