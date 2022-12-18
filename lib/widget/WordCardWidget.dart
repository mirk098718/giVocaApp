import 'package:flutter/material.dart';
import 'package:gi_english_app/class/Word.dart';

class WordCardWidget extends StatelessWidget {
  Word? word;
  WordCardWidget(this.word, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: word != null ? 1: 0,
      child: Container(
        margin: EdgeInsets.all(10),
        color: Colors.blue,
        width: 150,
        height: 150,
        child: Card(
          color: Colors.red,
          child: Column( mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(word?.word??""),
              Text(word?.part??""),
              Text(word?.meaning??""),
              Text(word?.example1??""),
              Text(word?.example2??""),
            ],),
        ),
      ),
    );
  }
}
