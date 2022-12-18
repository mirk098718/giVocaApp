import 'package:flutter/material.dart';
import 'package:gi_english_app/util/MenuUtil.dart';
import 'Palette.dart';

class MyWidget {
  static AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.purple,
      title: Text(
        "Gi",
        style: TextStyle(color: Colors.white),

      ),
    );
  }
  static Widget bottomNavi() {
    return BottomAppBar(
      child: Container(
        height: 70,
        child: Row(
          children: [
          ],
        ),
      ),
      color: Colors.purple,
    );
  }

  static Widget roundEdgeTextField(String hintText, TextEditingController controller, {bool obscureText=false}) {
    return Container(
      margin: EdgeInsets.only(top: 20,bottom: 20),
      padding: EdgeInsets.all(10),
      color: Colors.transparent,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  static Widget roundElevatedButton(String text, Color color, BuildContext context, Widget page){
    return ElevatedButton(
      onPressed: () {MenuUtil.push(context, page);},
      child: Text(text, textAlign: TextAlign.center,style: TextStyle(
          fontFamily: "Oneprettynight", color: Palette.white, fontSize: 12),),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Palette.black,
      ),
    );
  }

  static Widget maruburiTextButton(String text, Color color, double size){
    return TextButton(
      onPressed: () {},
      child: Text(text, textAlign: TextAlign.center,style: TextStyle(
          fontFamily: "MaruBuri", color: color, fontSize: size),),
      style: ElevatedButton.styleFrom(
      ),
    );
  }

}


// //mobile 상세메뉴
//
// static Widget mobileLeftMenuStart(Color selectedMenuColor, String content) {
//   return Container(
//     alignment: Alignment.center,
//     width: 150, height: 40,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
//       ,color: selectedMenuColor,
//     ),
//     child: Text(
//       content, textAlign: TextAlign.center, style: TextStyle(color: Palette.black, fontWeight: FontWeight.bold),
//     ),
//   );
// }
//
// static Widget mobileLeftMenuMiddle(Color menuColor, String menuContent) {
//   return Container(
//     color: menuColor,
//     alignment: Alignment.center,
//     width: 150, height: 40,
//     child: Text(
//       menuContent,
//       style: TextStyle(color: Palette.black, fontWeight: FontWeight.bold),
//     ),
//   );
// }
//
// static Widget mobileLeftMenuEnd(Color menuColor, String content) {
//   return Container(
//     alignment: Alignment.center,
//     width: 150, height: 40,
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
//         ,color: menuColor),
//     child: Text(content,
//       style: TextStyle(color: Palette.black, fontWeight: FontWeight.bold),
//     ),
//   );
// }




// Widget roundEdgeButton(String text, [Color color = Palette.white]) {
//   return ElevatedButton(
//     style: ButtonStyle(),
//     child: Text(text, style: TextStyle(),),
//     onPressed: (){},
//   );
// }
