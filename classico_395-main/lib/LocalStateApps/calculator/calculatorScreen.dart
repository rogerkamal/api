import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CalculatorScreenState();
  }
}


class CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstValue = TextEditingController();
  TextEditingController secondValue = TextEditingController();
  var a =0;
  var b =0;
  var sum = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
          title: Text(
            "Calculator",
            style: TextStyle(fontSize: 40),
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: firstValue,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabled: true,
                    hintText: "First value ...",
                    hintStyle: TextStyle(color: Colors.black38),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: secondValue,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabled: true,
                    hintText: "Second value ...",
                    hintStyle: TextStyle(color: Colors.black38),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      a = int.tryParse(firstValue.text)!;
                      b = int.tryParse(firstValue.text)!;
                      sum = add(a, b);
                      setState(() {

                      });
                    },

                    child: Text("+", style: TextStyle(fontSize: 50)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      a = int.tryParse(firstValue.text)!;
                      b = int.tryParse(firstValue.text)!;
                      sum = subtract(a, b);
                      setState(() {

                      });
                    },
                    child: Text("-", style: TextStyle(fontSize: 50)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      a = int.tryParse(firstValue.text)!;
                      b = int.tryParse(firstValue.text)!;
                      sum = multiply(a, b);
                      setState(() {

                      });
                    },
                    child: Text("x", style: TextStyle(fontSize: 50)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      double a = double.tryParse(firstValue.text)!;
                      double b = double.tryParse(firstValue.text)!;
                      sum = divide(a, b) ;
                      setState(() {

                      });
                    },
                    child: Text("÷", style: TextStyle(fontSize: 50)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: Colors.white),
                child: Center(
                    child: Text("$sum", style: TextStyle(fontSize: 50))),
              )
            ],
          ),
        ));
  }


  double add(int a, int b) {
    // int a=5;
    // int b=5;
    sum = (a+b).toDouble();
    return sum;
  }

  double subtract(int a, int b){
    sum = (a-b).toDouble();
    return sum;
  }

  double multiply(int a, int b){
    sum = (a*b).toDouble();
    return sum;
  }

  double divide(double a,double b){
    sum = (a/b);
    return sum;
  }
}


