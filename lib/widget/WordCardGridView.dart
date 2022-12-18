import 'package:flutter/material.dart';

import '../class/Word.dart';
import 'WordCardWidget.dart';

class WordCardGridView extends StatelessWidget {
  //인스턴스 필드 (WordCardGridView의 정적 속성.)
  List<Word> wordList;
  List<WordCardWidget> wordCardList = [];
  WordCardGridView({Key? key, required this.wordList}) : super(key: key);

  //인스턴스 메소드 (WordCardGridView의 동적 속성.)
  @override
  Widget build(BuildContext context) {
    //내 앞에 wordCardList가 있음.
    //위에서부터 순서대로 나열하고, 2개면, 아래로 내린다.(플루터 생가안했음.)

    List<Widget> chidren = [];

    //[v]전체는 컬럼이어야함
    //[v]i를 얻었음.
    //[v]i가 짝수면, 로우를 만든다, 그 로우에 데이터를 넣는다.
    //[v]홀수면 이전 로우에 데이터를 넣는다.
    //[v]새로운 로우를 넣기 전에 그것을 컬럼리스트에 넣어야한다.
    //0 1
    //2 3
    //4 5
    //6

    Row? oldRow;
    for (int i = 0; i < wordList.length;i++){
      Word word = wordList[i];
      Word? nextWord = i+1 < wordList.length ? wordList[i+1]: null;

      if((i%2) == 0){
        oldRow = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WordCardWidget(word),
            WordCardWidget(nextWord)
          ],
        );
        chidren.add(oldRow);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: chidren,
    );
  }
}
