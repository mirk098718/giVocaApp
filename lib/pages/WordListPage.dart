
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gi_english_app/pages/DictionaryPage.dart';
import 'package:gi_english_app/util/MenuUtil.dart';
import 'package:gi_english_app/util/MyWidget.dart';
import 'package:gi_english_app/util/SnackbarUtil.dart';
import 'package:gi_english_app/util/WidgetUtil.dart';

import '../class/Word.dart';
import '../util/Palette.dart';

// class A {}
//
// class B extends A {}
//
// class C extends B {}
//
// A a = B();
// //B b = A();
// //C c = A();
// //A a = C();
//
// Widget -> PreferredSizeWidget -> AppBar
// Pere~~~Widget widget = Widget(); //error.



class WordListPage extends StatefulWidget {
  const WordListPage({Key? key}) : super(key: key);


  @override
  _WordListPageState createState() => _WordListPageState();
}

class _WordListPageState extends State<WordListPage> {

  static List<Word> wordList = [];
  static List<Widget> wordCardList = [];
  TextEditingController wordController = TextEditingController();
  TextEditingController partController = TextEditingController();
  TextEditingController meaningController = TextEditingController();
  TextEditingController example1Controller = TextEditingController();
  TextEditingController example2Controller = TextEditingController();


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: MyWidget.appBar(),
      bottomNavigationBar: MyWidget.bottomNavi(),
      body: ListView(
          scrollDirection: Axis.vertical,
          children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.purple,
              margin: EdgeInsets.all(0),
              padding: EdgeInsets.all(0),
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    color: Colors.transparent,
                    child: Container(
                      child: Stack(
                        children: [
                          Container(child: Image.asset("assets/radish.png")),
                          Container(
                            alignment: Alignment.topRight,
                              margin: EdgeInsets.only(top: 5,right: 10),
                              child: Text("Mia")),
                          Container(
                            alignment: Alignment.bottomLeft,
                            height: 170,
                            color: Colors.transparent,
                            child: Row(children: [
                              Image.asset("assets/decorateCharacterButton.png"),
                            ]),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 25, left: 200),
                              width: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "My Level : Starter",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  Divider(),
                                  Text("My Point : 20P",
                                      style: TextStyle(fontSize: 12)),
                                  Divider(),
                                  Text("외운 단어 수 : 20",
                                      style: TextStyle(fontSize: 12)),
                                  Divider(),
                                  Text("못 외운 단어 수 : 100",
                                      style: TextStyle(fontSize: 12)),
                                ],
                              ))
                        ],
                      ),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // border: RoundedRectangleBorder(side: BorderSide(width: 0)),
                    // borderRadius: BorderRadius.only(
                    //     topLeft: Radius.circular(20),
                    //     topRight: Radius.circular(20)),
                  )),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset("assets/savedWordIcon.png"),
                        Spacer(),
                        Text(
                          "총 단어수",
                          style: TextStyle(fontSize: 12),
                        ),
                        Spacer(),
                        Text(
                          "20개",
                          style: TextStyle(fontSize: 20, color: Colors.red),
                        )
                      ],
                    ),
                    alignment: Alignment.center,
                    width: 100,
                    height: 130,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text("예문 연습율"), SizedBox(width:20), Text("발음 연습율")],
                        ),
                        alignment: Alignment.topCenter,
                        height: 130,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: gTextField("내 단어장 검색"),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("최근순"),
                SizedBox(width: 10),
                SizedBox(width: 10),
                Text("Alphabet순")
              ],
            ),
            roundElevatedButtonForCard("단어추가", Palette.mainPurple, context),
            SizedBox(height: 20),
            Column(children: wordCardList)






          ],
        ),
      ]),
    );
  }

  Widget roundElevatedButtonForCard(String text, Color color, BuildContext context){
    return Container(
      margin: EdgeInsets.all(10),
      width: 300,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          addWordDialogue(context, "새단어 추가", wordController,partController,meaningController,example1Controller,example2Controller);
        },
        child: Text(text, textAlign: TextAlign.center,style: TextStyle(
            fontFamily: "Oneprettynight", color: Palette.white, fontSize: 12),),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
      ),
    );
  }

  static Widget makeWordCard(Word word){
    return Container(
      margin: EdgeInsets.all(10),
      color: Colors.blue,
      width: 150,
      height: 150,
      child: Card(
        color: Colors.red,
        child: Column( mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(word.word),
            Text(word.part),
            Text(word.meaning),
            Text(word.example1),
            Text(word.example2),
          ],),
      ),
    );
  }

  static void addWordDialogue(BuildContext context, String content, TextEditingController controller,
      TextEditingController controller2,TextEditingController controller3,TextEditingController
      controller4,TextEditingController controller5) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Container(
              width: double.infinity,
              height: 500,
              alignment: Alignment.center,
              padding: EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      content,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20,),
                    WidgetUtil.textFieldWithLabel("단어 : ", controller),
                    WidgetUtil.textFieldWithLabel("품사 : ", controller2),
                    WidgetUtil.textFieldWithLabel("뜻 : ", controller3),
                    WidgetUtil.textFieldWithLabel("예문 1 : ", controller4),
                    WidgetUtil.textFieldWithLabel("예문 2 : ", controller5),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Palette.mainPurple,
                          foregroundColor: Palette.white,
                        ),
                        onPressed: (){

                          Word newWord = Word(controller.text, controller3.text,
                              part: controller2.text, example1: controller4.text,
                              example2: controller5.text );

                          for (Word word in wordList) {
                            if (newWord.word.toLowerCase() == word.word.toLowerCase()&& newWord.meaning == word.meaning){
                              SnackbarUtil.showSnackBar("해당 단어가 이미 있습니다.", context);
                            }
                            else {
                              wordList.add(newWord);
                              Widget newWordCard = makeWordCard(newWord);
                              wordCardList.add(newWordCard);
                            };
                          };
                          print(wordCardList);
                          MenuUtil.pop(context);

                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(fontFamily: "Jalnan"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }

  Widget gTextField(String hintText) {
    return Container(
      color: Colors.transparent,
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}