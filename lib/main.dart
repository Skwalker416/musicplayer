import 'package:amharicmusic/album_playlist.dart';

import 'package:flutter/material.dart';

import 'audio_page.dart';
import 'main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Audio App',
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
