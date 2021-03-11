//page information
import 'package:youtube_app/pages/pages.dart';
import 'package:flutter/material.dart';

final List<List> moreOption = const [
  [Icons.home, Colors.red, '首頁', false, true],
  [Icons.hot_tub, Colors.black54, '發燒影片', false, true],
  [Icons.subscriptions, Colors.black54, '訂閱內容', false, false],
  [null, null, null, true, null]
];

final List<List> icons = [
  ["Home", Icons.home],
  ["Explore", Icons.explore],
  ["Add", Icons.add],
  ["Subscriptions", Icons.subscriptions],
  ["Library", Icons.video_library],
];

final List<Widget> screens = [
  HomeScreen(),
  Scaffold(),
  Scaffold(),
  Scaffold(),
  Scaffold(),
  Scaffold(),
];
