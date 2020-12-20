import 'package:flutter/material.dart';
import 'package:wiki_app/components/WikiItemCard.dart';
import 'package:wiki_app/model/WikiModel.dart';

class WikiDetailsPage extends StatefulWidget {
  Pages pages;

  WikiDetailsPage(this.pages) : super();

  @override
  WikiDetailsPageState createState() => WikiDetailsPageState();
}

class WikiDetailsPageState extends State<WikiDetailsPage> {
  double width;
  double height;
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            WikiItemCard(
              pages: widget.pages,
            ),
          ],

        ),
      ),
    );
  }
}