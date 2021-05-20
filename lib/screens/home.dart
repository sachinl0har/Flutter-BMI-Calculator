import 'package:bmi/constants/app_constants.dart';
import 'package:bmi/widgets/center_bar.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style:
                TextStyle(color: accentHexColor, fontSize: 42, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 62,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height in Metres",
                        hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.9)),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 62,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight in KG",
                        hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.9)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if(_bmiResult > 42){
                      _textResult = "You\'re dangerously overweight";
                    } else if(_bmiResult >= 18.5 && _bmiResult <= 25){
    _textResult = "You have normal weight";
    }
                      else if(_bmiResult >=26 && _bmiResult <= 30){
                        _textResult = "You are in Pre-Obesity";
                    }else if(_bmiResult >= 31 && _bmiResult <= 35){
                        _textResult = "You are in Obesity Class 1";
                    }
                      else if(_bmiResult >= 36 && _bmiResult <= 40){
                        _textResult = "You are in Obesity Class 2";
                    }
                      else if(_bmiResult >= 41){
                        _textResult = "You are in Obesity Class 3";
                    }
                      else{
                      _textResult = "You\'re under weight";
                    }
                  });
                },
                child: Container(
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: accentHexColor),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  _bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: accentHexColor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                  child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor),
                ),
              )),
              SizedBox(
                height: 28,
              ),
              CenterBar(barWidth: 300),
              SizedBox(
                height: 8,
              ),
              CenterBar(barWidth: 200),
              SizedBox(
                height: 8,
              ),
              CenterBar(barWidth: 100),
              LeftBar(barWidth: 100),
              SizedBox(
                height: 18,
              ),
              LeftBar(
                barWidth: 200,
              ),
              RightBar(barWidth: 200),
              SizedBox(
                height: 18,
              ),
              RightBar(barWidth: 100),
              SizedBox(
                height: 18,
              ),
              RightBar(barWidth: 50),
            ],
          ),
        ));
  }
}
