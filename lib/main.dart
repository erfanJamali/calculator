import 'package:clc/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: main_page(),
    ),
  );
}

String mainTxtVal = "0";
String tempTextVal = "temp number";

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

late Size thisSize;

class _main_pageState extends State<main_page> {
  @override
  Widget build(BuildContext context) {
    //
    thisSize = MediaQuery.of(context).size;
    //
    return Scaffold(
      backgroundColor: kColorWhite,
      appBar: AppBar(
        backgroundColor: kColorWhite,
        centerTitle: true,
        title: const Text("CALCULATOR",
            style: TextStyle(fontSize: 35, fontFamily: "title_font")),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: kColorGreen02,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(color: kColorGreen02, blurRadius: 10)
                      ]),
                  child: Text(
                    tempTextVal,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: thisSize.width - 140,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: kColorGreen03,
                    boxShadow: [
                      BoxShadow(blurRadius: 10, color: kColorGreen03)
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      mainTxtVal,
                      maxLines: 4,
                      style: TextStyle(color: kColorWhite, fontSize: 36),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    makeButtonsHorizontal("C", thisSize, true, false, false),
                    makeButtonsHorizontal("/", thisSize, false, false, false),
                    makeButtonsHorizontal("*", thisSize, false, false, false),
                    makeButtonsHorizontal("-", thisSize, false, false, false),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            makeButtonsHorizontal(
                                "7", thisSize, false, false, false),
                            makeButtonsHorizontal(
                                "8", thisSize, false, false, false),
                            makeButtonsHorizontal(
                                "9", thisSize, false, false, false),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            makeButtonsHorizontal(
                                "4", thisSize, false, false, false),
                            makeButtonsHorizontal(
                                "5", thisSize, false, false, false),
                            makeButtonsHorizontal(
                                "6", thisSize, false, false, false),
                          ],
                        ),
                      ],
                    ),
                    makeButtonsHorizontal("+", thisSize, false, true, true),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            makeButtonsHorizontal(
                                "1", thisSize, false, false, false),
                            makeButtonsHorizontal(
                                "2", thisSize, false, false, false),
                            makeButtonsHorizontal(
                                "3", thisSize, false, false, false),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            makeButtonsHorizontal(
                                "0", thisSize, false, true, false),
                            makeButtonsHorizontal(
                                ".", thisSize, false, false, false),
                          ],
                        ),
                      ],
                    ),
                    makeButtonsHorizontal("=", thisSize, false, true, true),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text("vasslekaar created this by love!",
                style: TextStyle(color: kColorGreen01))
          ],
        ),
      ),
    );
  }

  String operator = "";

  Widget makeButtonsHorizontal(String btnText, Size thisSize, bool doRed,
      bool bigBtn, bool orientation) {
    //
    double defSize = ((thisSize.width - 200) / 4);
    //
    return Container(
      margin: const EdgeInsets.all(10),
      height: (bigBtn && orientation) ? (defSize * 2) + 20 : defSize,
      width: (bigBtn && !orientation) ? (defSize * 2) + 20 : defSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: (doRed)
                  ? Colors.red
                  : (operator == btnText)
                      ? Colors.orangeAccent
                      : kColorGreen01)
        ],
      ),
      child: Material(
        color: (doRed)
            ? Colors.red
            : (operator == btnText)
                ? Colors.orangeAccent
                : kColorGreen01,
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () {
            setState(() {
              switch (btnText) {
                case "C":
                  mainTxtVal = "0";
                  tempTextVal =
                      (tempTextVal != "temp number") ? "0" : "temp number";
                  operator = "";
                  break;
                case "/":
                case "*":
                case "-":
                case "+":
                  //
                  if (tempTextVal != "temp number" && operator != "") {
                    tempTextVal = calculate().toString();
                    mainTxtVal = "0";
                    operator = btnText;
                    break;
                  }
                  //
                  if (operator == btnText){
                     operator = "";
                  } else {
                    operator = btnText;
                    tempTextVal = mainTxtVal;
                    mainTxtVal = "0";
                  }
                  break;
                case "=":
                  mainTxtVal = calculate().toString();
                  tempTextVal = "0";
                  operator = "";
                  break;
                case "0":
                case "1":
                case "2":
                case "3":
                case "4":
                case "5":
                case "6":
                case "7":
                case "8":
                case "9":
                  if (mainTxtVal == "0") {
                    if (btnText == "0") {
                      return;
                    } else {
                      mainTxtVal = btnText;
                    }
                  } else {
                    mainTxtVal += btnText;
                  }
                  break;
                case ".":
                  //
                  if (mainTxtVal.contains(".")) {
                    return;
                  } else {
                    mainTxtVal += btnText;
                  }
                  //
                  break;
              }
            });
          },
          child: Align(
            alignment: (bigBtn && orientation)
                ? Alignment.topLeft
                : (bigBtn && !orientation)
                    ? Alignment.centerLeft
                    : Alignment.center,
            child: Container(
              padding: (bigBtn && !orientation)
                  ? const EdgeInsets.only(left: (25))
                  : ((bigBtn && orientation))
                      ? const EdgeInsets.only(left: 15)
                      : null,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Text(
                btnText,
                style: TextStyle(color: kColorWhite, fontSize: 36),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double calculate() {
    //
    double resualt = 0;
    double mainNum = double.parse(mainTxtVal);
    double tempNum = double.parse(tempTextVal);
    //
    switch (operator) {
      case "/":
        resualt = tempNum / mainNum;
        break;
      case "*":
        resualt = tempNum * mainNum;
        break;
      case "-":
        resualt = tempNum - mainNum;
        break;
      case "+":
        resualt = tempNum + mainNum;
        break;
    }
    ;
    //
    return resualt;
  }
}
