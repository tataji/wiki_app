import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wiki_app/model/WikiModel.dart';

class WikiItemCard extends StatelessWidget {
  final Function press;
  Pages pages;
   WikiItemCard({
    Key key,
    this.pages,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(onTap: (){
      press();
    },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container( width: width,
          height: height/6,
          decoration: new BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Color(0x1a181818),
                  offset: Offset(0, 1),
                  blurRadius: 25,
                  spreadRadius: 0)
            ],
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              pages.thumbnail!=null?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(width:50,height: 50,
                    child: Image.network(pages.thumbnail.source)),
              ):Container(width:50,height: 50,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Name: ${pages.title}'),
                    Container(width: width-150,
                        child: Text('Description: ${pages.terms==null?"NA":pages.terms.description}')),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}