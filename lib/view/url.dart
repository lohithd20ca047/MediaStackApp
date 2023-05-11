import 'package:flutter/material.dart';

import '../model/news_model.dart';

class Url extends StatelessWidget {
  Url({Key? key}) : super(key: key);
  Datum? datum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: datum!.url,
      ),
    );
  }
}
