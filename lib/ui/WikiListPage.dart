import 'package:flutter/material.dart';
import 'package:wiki_app/Components/WikiItemCard.dart';
import 'package:wiki_app/localdb/SQLiteDatabaseProvider.dart';
import 'package:wiki_app/model/WikiModel.dart';
import 'package:wiki_app/service/ApiService.dart';
import 'WikiDeatilsPage.dart';

class WikiListPage extends StatefulWidget {
  WikiListPage() : super();
  @override
  WikiListPageState createState() => WikiListPageState();
}

class WikiListPageState extends State<WikiListPage> {
  double width; double height;
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
        title: Text('Wiki List'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          FutureBuilder<List<Pages>>(
            future: getWikiPageDetails(),
            builder: (context,data){
              if(!data.hasData){
                return Center(child: CircularProgressIndicator());
              }else {
                return Container(
                  height: MediaQuery.of(context).size.height-100,
                  child: ListView.builder(
                    shrinkWrap: false,
                    scrollDirection: Axis.vertical,
                    itemCount: data.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: WikiItemCard(
                          pages: data.data[index],
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WikiDetailsPage(data.data[index])),
                            );
                          },),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
  Future<List<Pages>> getWikiPageDetails() async {
    // List<Pages> pagesList = await SQLiteDatabaseProvider.db.getAllPagesListStoredLocalDb();
    // if(pagesList.isNotEmpty){
    //   return pagesList;
    // }else {
      WikiModel wikiModel = await apiService.fetchWikiDetails();
      insertPagesToSQLiteData(wikiModel.query.pages);
      return wikiModel.query.pages;
   // }
  }
  void insertPagesToSQLiteData(List<Pages> pagesList) async {
    for (int i = 0; i < pagesList.length; i++) {
      await SQLiteDatabaseProvider.db.addPagesToDatabase(pagesList[i]);
    }
  }
}