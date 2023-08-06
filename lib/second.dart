import 'package:diabetes_detection/widget/buttonWidget.dart';
import 'package:flutter/material.dart';

class Secondpage extends StatefulWidget {
  const Secondpage({super.key});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

Widget Question({required String text}) {
  return Text(
    text,
    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  );
}

Widget Options({required String option}) {
  return Row(children: [
    Text(
      "\u2022",
      style: TextStyle(fontSize: 30),
    ), //bullet text
    SizedBox(
      width: 10,
    ),
    Expanded(
      child: Text(
        option,
        style: TextStyle(
            fontSize: 15,
            color: Color(0xff53828c),
            fontWeight: FontWeight.w600),
      ), //text
    )
  ]);
}

Widget InputTextField() {
  return TextField(
      minLines: 1,
      maxLines: 5,
      // maxLength: 200,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent, width: 0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.transparent, width: 0)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: Colors.white,
        hintText: "Your Answer",
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ));
}

List<String> option1 = [
  "Soft and spongy (like you can easily pinch a lot of flesh)",
  "Moderately soft and spongy (like you can pinch a little bit of flesh)",
  "Moderately hard and dense (like you can't pinch much flesh)",
  "Hard and dense (like you can't pinch any flesh)"
];
List<String> option2 = [
  'Yes, I currently take medication for high blood pressure',
  'No, I have never taken medication for high or low blood pressure.'
];
List<String> option3 = [
  'Within the past hour',
  'Within the past 2-3 hours',
  'Within the past 4-6 hours',
  'Within the past 7-12 hours'
];
List<String> option4 = [
  'No symptoms',
  'Mild symptoms (slight shakiness, increased heart rate, or mild sweating)',
  'Moderate symptoms (significant shakiness, increased heart rate, sweating, or mild confusion)',
  'Severe symptoms (extreme shakiness, increased heart rate, sweating, confusion, or loss of consciousness)'
];
List<String> option5 = [
  'No',
  'yes: grandparent uncle aunt first cousin',
  'yes: brother sister own child parent'
];
List<String> option6 = [
  'Under 45 years',
  '45-54 years',
  '55-64 years',
  'Over 64 years'
];

// List<String> option1 = [];

class _SecondpageState extends State<Secondpage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Widget sizedbox = SizedBox(
      height: height * 0.03,
    );
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
              color: Color(
            0xff53828c,
          )),
          title: const Text(
            "Question",
            style: TextStyle(
                color: Color(
                  0xff53828c,
                ),
                fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Question(
                  text:
                      '1) Do you know your triceps skin fold thickness measurement? If not, you can estimate it by answering the following question:'),
              Options(option: option1[0]),
              Options(option: option1[1]),
              Options(option: option1[2]),
              Options(option: option1[3]),
              sizedbox,
              InputTextField(),
              sizedbox,
              Question(
                  text:
                      '2) Have you ever taken medication regularly to manage high blood pressure?'),
              Options(option: option2[0]),
              Options(option: option2[1]),
              sizedbox,
              InputTextField(),
              sizedbox,
              Question(
                  text:
                      '3) Do you know your current plasma glucose concentration level in mg/dL? If not, you can estimate it by answering the following question:'),
              Options(option: option3[0]),
              Options(option: option3[1]),
              Options(option: option3[2]),
              Options(option: option3[3]),
              sizedbox,
              InputTextField(),
              sizedbox,
              Question(
                  text:
                      '4) Do you experience any of the following symptoms after consuming a meal?'),
              Options(option: option4[0]),
              Options(option: option4[1]),
              Options(option: option4[3]),
              Options(option: option4[2]),
              sizedbox,
              InputTextField(),
              sizedbox,
              Question(
                  text:
                      '5) Has anyone in your immediate family or other relatives been diagnosed with diabetes?'),
              sizedbox,
              Options(option: option5[0]),
              Options(option: option5[1]),
              Options(option: option5[2]),
              sizedbox,
              InputTextField(),
              sizedbox,
              Question(
                  text:
                      '6) Please select your Age from between the given ranges'),
              sizedbox,
              Options(option: option6[0]),
              Options(option: option6[1]),
              Options(option: option6[2]),
              Options(option: option6[3]),
              sizedbox,
              InputTextField(),
              sizedbox,
              Question(text: '7) Enter your BMI (Body Mass Index)'),
              sizedbox,
              InputTextField(),
              sizedbox,
              Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      text: "Cancel",
                      textColor: Colors.white,
                      containerColor: const Color(0xff53828c),
                      width: width * 0.45,
                      height: height * 0.09,
                      call: () {
                        Navigator.pop(context);
                      },
                      borderRadius: 5,
                    ),
                  ),
                  Expanded(
                    child: CustomContainer(
                      text: "Submit",
                      textColor: Colors.white,
                      containerColor: Color(0xff53828c),
                      width: width * 0.45,
                      height: height * 0.09,
                      call: () {
                        // Navigator.pushNamed(context, 'second');
                      },
                      borderRadius: 5,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
