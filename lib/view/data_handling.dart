import 'package:flutter/material.dart';
import 'package:media_stack/model/news_model.dart';

class DataHandling extends StatefulWidget {
  const DataHandling({Key? key}) : super(key: key);

  @override
  _DataHandlingState createState() => _DataHandlingState();
}

class _DataHandlingState extends State<DataHandling> {
  Datum? datum;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(datum!.title!)],
    );
  }
}
