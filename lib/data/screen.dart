//page information
import 'package:youtube_app/views/views.dart';
import 'package:flutter/material.dart';

//[ icon, color, name, liner, forget ]
final List<List> moreOption = const [
  [Icons.home, Colors.red, '首頁', false, true],
  [Icons.whatshot, Colors.black54, '發燒影片', false, true],
  [Icons.subscriptions, Colors.black54, '訂閱內容', false, false],
  [null, null, null, true, null]
];

final List<Widget> views = [
  HomeView(),
  Scaffold(),
  Scaffold(),
  Scaffold(),
  Scaffold(),
  Scaffold(),
];
