import 'package:flutter/material.dart';
import 'package:media_stack/model/news_model.dart';

class DataHandling extends StatefulWidget {
  const DataHandling({Key? key, required this.datum}) : super(key: key);
  final Datum? datum;
  @override
  _DataHandlingState createState() => _DataHandlingState();
}

class _DataHandlingState extends State<DataHandling> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(widget.datum!.title!)],
    );
  }
}
