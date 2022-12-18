import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gi_english_app/util/MyWidget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({Key? key}) : super(key: key);

  @override
  _DictionaryPageState createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  @override
  void initState() {
    super.initState();
    // // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyWidget.appBar(),
      body: WebView(
        initialUrl: "https://m.dic.daum.net",
        javascriptMode: JavascriptMode.unrestricted,
      ),
      bottomNavigationBar: MyWidget.bottomNavi(),
    );
  }
}
