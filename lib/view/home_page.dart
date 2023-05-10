import 'package:flutter/material.dart';
import 'package:media_stack/model/news_model.dart';
import 'package:media_stack/service/news_services.dart';

import 'data_handling.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text(
            'NewsToday',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          )),
        ),
        body: getBody());
  }

  Widget getBody() {
    return FutureBuilder(
      future: listOfNews(),
      builder: (BuildContext context, AsyncSnapshot<List<Datum>> snapshot) {
        return ListView(
          children: newsDesigns(snapshot.data!),
        );
      },
    );
  }

  List<Widget> newsDesigns(List<Datum> datas) {
    var widgets = <Widget>[];

    for (var data in datas) {
      var widget = DataHandling();
      widgets.add(widget);
    }

    return widgets;
  }
}
