
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gi_english_app/util/MenuUtil.dart';
import 'package:gi_english_app/util/MyWidget.dart';
import 'package:gi_english_app/util/SnackbarUtil.dart';
import 'package:gi_english_app/util/WidgetUtil.dart';

import '../class/Word.dart';
import '../util/Palette.dart';
import '../widget/WordCardGridView.dart';

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
  List<Word> wordList = [];
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
                                  Text("?????? ?????? ??? : 20",
                                      style: TextStyle(fontSize: 12)),
                                  Divider(),
                                  Text("??? ?????? ?????? ??? : 100",
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
                          "??? ?????????",
                          style: TextStyle(fontSize: 12),
                        ),
                        Spacer(),
                        Text(
                          "20???",
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
                          children: [Text("?????? ?????????"), SizedBox(width:20), Text("?????? ?????????")],
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
                child: gTextField("??? ????????? ??????"),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("?????????"),
                SizedBox(width: 10),
                SizedBox(width: 10),
                Text("Alphabet???")
              ],
            ),
            roundElevatedButtonForCard("????????????", Palette.mainPurple, context),
            SizedBox(height: 20),
            WordCardGridView(wordList:wordList),
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
          showDialogToAddWord(context, "????????? ??????");
        },
        child: Text(text, textAlign: TextAlign.center,style: TextStyle(
            fontFamily: "Oneprettynight", color: Palette.white, fontSize: 12),),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
        ),
      ),
    );
  }


  void showDialogToAddWord(BuildContext context, String content) {
    wordController.text = "";
    partController.text = "";
    meaningController.text = "";
    example1Controller.text = "";
    example2Controller.text = "";
    showDialog(
      context: context,
      builder: (context) {
        //~~~
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
                    WidgetUtil.textFieldWithLabel("?????? : ", wordController),
                    WidgetUtil.textFieldWithLabel("?????? : ", partController),
                    WidgetUtil.textFieldWithLabel("??? : ", meaningController),
                    WidgetUtil.textFieldWithLabel("?????? 1 : ", example1Controller),
                    WidgetUtil.textFieldWithLabel("?????? 2 : ", example2Controller),
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
                        onPressed: addWord,
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

  void addWord(){
    Word newWord = Word(wordController.text, meaningController.text,
        part: partController.text, example1: example1Controller.text,
        example2: example2Controller.text );

    //???????????? ????????? ??????.
    //????????? ????????? ?????? ??????????????????????
    //- ????????? ?????? ????????? ?????????, ?????????.
    //- ????????? ?????? ?????????, ????????? ?????????????????????.
    localAddWord(){
      print("new word");
      wordList.add(newWord);
    }

    if(wordList.isEmpty) {
      localAddWord();
    }
    else {
      for (Word eachWord in wordList) {
        if (newWord.word.toLowerCase() == eachWord.word.toLowerCase() &&
            newWord.meaning == eachWord.meaning) {
          SnackbarUtil.showSnackBar("?????? ????????? ?????? ????????????.", context);
        }
        else {
          localAddWord();
          break;
        }
      };
    }

    setState(() {});

    MenuUtil.pop(context);
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
