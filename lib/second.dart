// import 'dart:js';

import 'package:diabetes_detection/widget/buttonWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    const Text(
      "\u2022",
      style: TextStyle(fontSize: 30),
    ), //bullet text
    const SizedBox(
      width: 10,
    ),
    Expanded(
      child: Text(
        option,
        style: const TextStyle(
            fontSize: 15,
            color: Color(0xff53828c),
            fontWeight: FontWeight.w600),
      ), //text
    )
  ]);
}

Widget inputTextField({required controller, required keyBtype}) {
  return TextField(
      controller: controller,
      keyboardType: keyBtype,
      minLines: 1,
      maxLines: 5,
      // maxLength: 200,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent, width: 0)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent, width: 0)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: Colors.white,
        hintText: "Your Answer",
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ));
}

List<String> option1 = [
  "Soft and spongy (like you can easily pinch a lot of flesh)  (20-30 mm)",
  "Moderately soft and spongy (like you can pinch a little bit of flesh) (15-20 mm)",
  "Moderately hard and dense (like you can't pinch much flesh) (10-15 mm)",
  "Hard and dense (like you can't pinch any flesh) (10 mm)"
];
List<String> option2 = [
  'Yes, I currently take medication for high blood pressure.  ( range from 130/80 mm Hg to 180/110 mm Hg or higher.)',
  'No, I have never taken medication for high or low blood pressure. ( less than 120/80 mm Hg)'
];
List<String> option3 = [
  'Within the past hour. (140-180 mg/dL)',
  'Within the past 2-3 hours. (140-180 mg/dL)',
  'Within the past 4-6 hours. (100-140 mg/dL)',
  'Within the past 7-12 hours. (80-120 mg/dL)'
];
List<String> option4 = [
  'No symptoms. (Below 5 mu U/ml)',
  'Mild symptoms (slight shakiness, increased heart rate, or mild sweating). (Between 5-10 mu U/ml)',
  'Moderate symptoms (significant shakiness, increased heart rate, sweating, or mild confusion). (Between 10-15 mu U/ml)',
  'Severe symptoms (extreme shakiness, increased heart rate, sweating, confusion, or loss of consciousness). (Above 15 mu U/ml)'
];
List<String> option5 = [
  'No. (0)',
  'yes: grandparent uncle aunt first cousin. (from 0 to 1.5)',
  'yes: brother sister own child parent. (from 0 to 2.5)'
];
List<String> option6 = [
  'Under 45 years',
  '45-54 years',
  '55-64 years',
  'Over 64 years'
];

// ALL TEXT CONTROLLER/
TextEditingController pregnanciesController = TextEditingController();
TextEditingController glucoseController = TextEditingController();
TextEditingController bloodPressureController = TextEditingController();
TextEditingController skinThicknessController = TextEditingController();
TextEditingController insulinController = TextEditingController();
TextEditingController bmiController = TextEditingController();
TextEditingController diabetesPedigreeController = TextEditingController();
TextEditingController ageController = TextEditingController();
String predictionResult = "";

class _SecondpageState extends State<Secondpage> {
  Widget showD(BuildContext context) {
    return AlertDialog(
      title: const Text("DIABETES PREDICTION"),
      content: Text('Prediction Result: $predictionResult'),
      actions: [
        ElevatedButton(
            onPressed: () {
              pregnanciesController.clear();
              glucoseController.clear();
              bloodPressureController.clear();
              skinThicknessController.clear();
              insulinController.clear();
              bmiController.clear();
              diabetesPedigreeController.clear();
              ageController.clear();
              Navigator.of(context).pop(false);
            },
            child: Text("okay"))
      ],
    );
  }

  // PREDICT DIABETES FUNCTION
  Future<void> predictDiabetes() async {
    final response = await http.post(
      Uri.parse(
          'http://192.168.0.3:8000/predict'), // Replace with your server URL
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "pregnancies": int.parse(pregnanciesController.text),
        "glucose": double.parse(glucoseController.text),
        "bloodpressure": double.parse(bloodPressureController.text),
        "skinthickness": double.parse(skinThicknessController.text),
        "insulin": double.parse(insulinController.text),
        "bmi": double.parse(bmiController.text),
        "diabetespedigreefunction":
            double.parse(diabetesPedigreeController.text),
        "age": int.parse(ageController.text),
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        predictionResult = response.body;
        // ageController.clear();
      });
    } else {
      setState(() {
        predictionResult = "Error: ${response.statusCode}";
      });
    }
  }

  // void showDialogue() {
  //   AlertDialog(
  //     title: Text("Diabetes prediction"),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Widget sizedbox = SizedBox(
      height: height * 0.045,
    );
    Widget sizedbox1 = SizedBox(
      height: height * 0.01,
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
              sizedbox1,
              inputTextField(
                controller: skinThicknessController,
                keyBtype: const TextInputType.numberWithOptions(decimal: true),
              ),
              sizedbox,
              Question(
                  text:
                      '2) Have you ever taken medication regularly to manage high blood pressure?'),
              Options(option: option2[0]),
              Options(option: option2[1]),
              sizedbox1,
              inputTextField(
                controller: bloodPressureController,
                keyBtype: const TextInputType.numberWithOptions(decimal: true),
              ),
              sizedbox,
              Question(
                  text:
                      '3) Do you know your current plasma glucose concentration level in mg/dL? If not, you can estimate it by answering the following question:'),
              Options(option: option3[0]),
              Options(option: option3[1]),
              Options(option: option3[2]),
              Options(option: option3[3]),
              sizedbox1,
              inputTextField(
                controller: glucoseController,
                keyBtype: const TextInputType.numberWithOptions(decimal: true),
              ),
              sizedbox,
              Question(
                  text:
                      '4) Do you experience any of the following symptoms after consuming a meal?'),
              Options(option: option4[0]),
              Options(option: option4[1]),
              Options(option: option4[3]),
              Options(option: option4[2]),
              sizedbox1,
              inputTextField(
                controller: insulinController,
                keyBtype: const TextInputType.numberWithOptions(decimal: true),
              ),
              sizedbox,
              Question(
                  text:
                      '5) Has anyone in your immediate family or other relatives been diagnosed with diabetes?'),
              // sizedbox,
              Options(option: option5[0]),
              Options(option: option5[1]),
              Options(option: option5[2]),
              sizedbox1,
              inputTextField(
                controller: diabetesPedigreeController,
                keyBtype: const TextInputType.numberWithOptions(decimal: true),
              ),
              sizedbox,
              Question(
                  text:
                      '6) Please select your Age from between the given ranges'),
              // sizedbox,
              Options(option: option6[0]),
              Options(option: option6[1]),
              Options(option: option6[2]),
              Options(option: option6[3]),
              sizedbox1,
              inputTextField(
                  controller: ageController, keyBtype: TextInputType.number),
              sizedbox,
              Question(text: '7) Enter your BMI (Body Mass Index)'),
              sizedbox1,
              inputTextField(
                controller: bmiController,
                keyBtype: const TextInputType.numberWithOptions(decimal: true),
              ),
              sizedbox,
              Question(text: "8) Enter number of pregnancies ?"),
              sizedbox1,
              inputTextField(
                controller: pregnanciesController,
                keyBtype: const TextInputType.numberWithOptions(decimal: true),
              ),
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
                      containerColor: const Color(0xff53828c),
                      width: width * 0.45,
                      height: height * 0.09,
                      call: () {
                          predictDiabetes();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return showD(context);
                            });
                      },
                      borderRadius: 5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Text('Prediction Result: $predictionResult'),
            ],
          ),
        ));
  }
}