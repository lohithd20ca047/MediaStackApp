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
    return SizedBox(
      height: 250,
      width: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          margin: const EdgeInsets.all(10),
          elevation: 10,
          shadowColor: Colors.cyan,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(widget.datum!.title!,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    widget.datum!.url!,
                    style: const TextStyle(fontSize: 8, color: Colors.blue),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
