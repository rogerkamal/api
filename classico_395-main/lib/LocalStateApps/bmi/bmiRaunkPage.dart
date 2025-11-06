import 'dart:math';

import 'package:flutter/material.dart';

class BmiRaunkPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => BmiRaunkPageState();

}

class BmiRaunkPageState extends State<BmiRaunkPage>{
  var wtController = TextEditingController();
  var htFeetController = TextEditingController();
  var htInchController = TextEditingController();
  String result = "";
  String healthType = "";
  String imgPath = "";
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: wtController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.line_weight),
                  label: Text('Weight(in KGs)'),
                  hint: Text("Enter your weight here.."),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  )
              ),
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: htFeetController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.height),
                  label: Text('Height(in Feet)'),
                  hint: Text("Enter your height in feet here.."),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  )
              ),
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: htInchController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.height),
                  label: Text('Height(in Inch)'),
                  hint: Text("Enter your height in inch here.."),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  )
              ),
            ),
            SizedBox(
              height: 21,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    if(wtController.text.isNotEmpty && htFeetController.text.isNotEmpty && htInchController.text.isNotEmpty){
                      num wt = double.parse(wtController.text);
                      int ft = int.parse(htFeetController.text);
                      int inch = int.parse(htInchController.text);

                      num htTotalInch = (ft*12)+inch;

                      num htCM = htTotalInch*2.54;

                      num htM = htCM/100;

                      num bmi = wt/pow(htM, 2.0);

                      result = "Your BMI is ${bmi.toStringAsFixed(2)}";

                      if(bmi>25){
                        healthType = "OverWeight";
                        bgColor = Colors.red.shade200;
                        imgPath = "assets/images/overwt.jpg";
                      } else if(bmi<18){
                        healthType = "UnderWeight";
                        bgColor = Colors.yellow.shade200;
                        imgPath = "assets/images/underwt.jpg";

                      } else {
                        healthType = "Healthy";
                        bgColor = Colors.green.shade200;
                        imgPath = "assets/images/healthywt.jpg";
                      }

                    } else {
                      result = "Please fill all the required fields";
                    }

                    setState(() {

                    });

                  },
                  child: Text('Calculate'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber
                  ),
                )),
            SizedBox(
              height: 11,
            ),
            result!="" ? Text(result, style: TextStyle(fontSize: 25),) : Container(),
            healthType!="" ? Text(healthType, style: TextStyle(fontSize: 25),) : Container(),
            imgPath != "" ? Expanded(child: SingleChildScrollView(child: Image.asset(imgPath))) : Container()
          ],
        ),
      ),
    );
  }
}