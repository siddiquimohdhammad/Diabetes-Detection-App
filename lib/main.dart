import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diabetes Prediction App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PredictionPage(),
    );
  }
}

class PredictionPage extends StatefulWidget {
  @override
  _PredictionPageState createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  TextEditingController pregnanciesController = TextEditingController();
  TextEditingController glucoseController = TextEditingController();
  TextEditingController bloodPressureController = TextEditingController();
  TextEditingController skinThicknessController = TextEditingController();
  TextEditingController insulinController = TextEditingController();
  TextEditingController bmiController = TextEditingController();
  TextEditingController diabetesPedigreeController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String predictionResult = "";

  Future<void> predictDiabetes() async {
    final response = await http.post(
      Uri.parse('http://192.168.0.5:8000/predict'), // Replace with your server URL
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
        "diabetespedigreefunction": double.parse(diabetesPedigreeController.text),
        "age": int.parse(ageController.text),
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        predictionResult = response.body;
      });
    } else {
      setState(() {
        predictionResult = "Error: ${response.statusCode}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diabetes Prediction App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: pregnanciesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Pregnancies'),
              ),
              TextField(
                controller: glucoseController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Glucose'),
              ),
              TextField(
                controller: bloodPressureController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Blood Pressure'),
              ),
              TextField(
                controller: skinThicknessController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Skin Thickness'),
              ),
              TextField(
                controller: insulinController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Insulin'),
              ),
              TextField(
                controller: bmiController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'BMI'),
              ),
              TextField(
                controller: diabetesPedigreeController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Diabetes Pedigree Function'),
              ),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: predictDiabetes,
                child: Text('Predict'),
              ),
              SizedBox(height: 16),
              Text('Prediction Result: $predictionResult'),
            ],
          ),
        ),
      ),
    );
  }
}
