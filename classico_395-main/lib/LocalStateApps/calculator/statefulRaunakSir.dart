import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorLocalStatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalculatorLocalStatePageState();
}

class CalculatorLocalStatePageState extends State<CalculatorLocalStatePage> {
  var no1Controller = TextEditingController();
  var no2Controller = TextEditingController();

  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Calculator', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(
              height: 21,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: no1Controller,
              decoration: InputDecoration(
                label: Text("No 1"),
                hintText: "Enter first number",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21)
                ),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: no2Controller,
              decoration: InputDecoration(
                label: Text("No 2"),
                hintText: "Enter second number",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21)
                ),
              ),
            ),
            SizedBox(
              height: 21,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  calculate();
                }, child: Text('+')),
                ElevatedButton(onPressed: (){
                  calculate(flag: 2);
                }, child: Text('-')),
                ElevatedButton(onPressed: (){
                  calculate(flag: 3);
                }, child: Text('*')),
                ElevatedButton(onPressed: (){
                  calculate(flag: 4);
                }, child: Text('/')),
              ],
            ),
            SizedBox(
              height: 11,
            ),
            result!="" ? Text(result, style: TextStyle(fontSize: 20),) : Container(),
          ],
        ),
      ),

    );
  }

  void calculate({int flag = 1}){ ///1-> add, 2-> sub, 3-> multi, 4-> div
    int no1 = int.parse(no1Controller.text);
    int no2 = int.parse(no2Controller.text);

    if(flag==1){
      num sum = no1+no2;
      result = "The division of $no1 and $no2 is $sum";
    } else if(flag==2){
      num diff = no1-no2;
      result = "The diff of $no1 and $no2 is $diff";
    } else if(flag==3){
      num product = no1*no2;
      result = "The product of $no1 and $no2 is $product";
    } else {
      num div = no1/no2;
      result = "The division of $no1 and $no2 is $div";
    }


    setState(() {

    });
    print(result);


  }
}
