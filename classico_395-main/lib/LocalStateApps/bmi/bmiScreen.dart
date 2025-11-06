import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// bmi = (Wt/ht)^2 SI unit
class BmiScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BmiScreenState();
}

class BmiScreenState extends State<BmiScreen> {
  var htfeetController = TextEditingController();
  var htinchesController = TextEditingController();
  var wtController = TextEditingController();
  num htMeters = 0;
  num bmiValue = 0;
  var bmiText = "Provide input";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    child: Stack(
                      children: [
                        Icon(Icons.favorite_outline,
                            size: 300,
                            color: Colors.red // Light background icon
                            ),
                        Center(
                          child: Text(
                            '${bmiValue.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                      child: Text(bmiText,
                          style: TextStyle(color: Colors.teal, fontSize: 50))),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Male",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.male,
                            size: 80,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Text("Female",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold)),
                          Icon(
                            Icons.female,
                            size: 80,
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Height(feet)",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.grey[600])),
                              /*Text(
                                "22",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),*/

                              Container(
                                margin: EdgeInsets.only(left: 30),
                                child: TextField(

                                  keyboardType: TextInputType.number,
                                  controller: htfeetController,
                                  /*onChanged: (htfeetController){

                                  },*/

                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      enabled: true,
                                      hint: Text("0",
                                          style: TextStyle(fontSize: 50,
                                          fontWeight: FontWeight.bold,color: Colors.grey[300])),
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: InputBorder.none,
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 1,
                          height: 70,
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Height(inches)",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[600]),
                              ),
                              /*Text(
                                "175",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),*/
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: TextField(

                                  keyboardType: TextInputType.number,
                                  controller: htinchesController,
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      hint: Text("00",
                                          style: TextStyle(fontSize: 50,
                                              fontWeight: FontWeight.bold,color: Colors.grey[300])),
                                      enabled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: 1,
                          child: Container(
                            color: Colors.grey,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey[600]),
                              ),
                              /*Text(
                                "75",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),*/
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: wtController,
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                      hint: Text("0 kg",
                                          style: TextStyle(fontSize: 50,
                                              fontWeight: FontWeight.bold,color: Colors.grey[300])),
                                      enabled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            height: 80,
            decoration: BoxDecoration(
              color: Colors.teal[300],
            ),
            child: InkWell(
              onTap: (){
                calculateBmi();
              },
                child: Center(
                    child: Text(
              "Calculate BMI",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ))),
          ),
        ],
      ),
    );
  }

  void calculateBmi() {
    double htFeets;
    double htInches;
    htFeets = double.tryParse(htfeetController.text) ?? 0.0;
    htInches = double.tryParse(htinchesController.text) ?? 0.0;

    num WtKg = double.tryParse(wtController.text) ?? 0.0;

    if(htInches != 0 && htFeets != 0 && WtKg != 0){
      htMeters = ((htFeets * 12) + htInches) * 0.0254;

      bmiValue = WtKg / pow(htMeters, 2);


      if (bmiValue < 18.5) {
        bmiText = "Underweight";
        setState(() {

        });
      } else if (bmiValue > 18.5 && bmiValue < 24.9) {
        bmiText = "Healthy";
        setState(() {

        });
      } else if (bmiValue > 25 && bmiValue < 29.9) {
        bmiText = "Overweight";
        setState(() {

        });
      } else if (bmiValue >= 30) {
        bmiText = "Obese";
        setState(() {

        });
      }
    }else {
      showAlert('Please enter all the required inputs');
    }

  }

  void showAlert(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP, // or TOP, CENTER
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

}
