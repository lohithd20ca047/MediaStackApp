import 'package:flutter/material.dart';
import 'package:media_stack/model/news_model.dart';

int getmemeTime() {
  var currentTime = TimeOfDay.now();
  var obtainedTime = NewsArticle.fromJson(published_at);
  if (currentTime != obtainedTime) {}
  return getmemeTime();
}
