
import 'package:flutter/material.dart';
import 'package:gi_english_app/pages/DictionaryPage.dart';
import 'package:gi_english_app/pages/WordListPage.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Gi English App",
      home: WordListPage(),
    );
  }
}
