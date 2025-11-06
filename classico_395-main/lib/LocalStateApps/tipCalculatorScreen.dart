import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TipCalculatorScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TipCalculatorScreenState();
}

class TipCalculatorScreenState extends State<TipCalculatorScreen> {

  var billAmountController = TextEditingController();
  int split =1;
  double billAmount = 0;
  double tipAmount = 0;

  double tip = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 25,horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/hat.png",
                    width: 60, height: 50, color: Colors.black),
                SizedBox(width: 5,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 5, right: 5),
                          child: Text("Mr",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ),
                        Text("TIP",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30)),
                      ],
                    ),
                    Container(
                      // margin: EdgeInsets.only(left: 35),
                      child: Text("Calculator",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                  ],
                )
              ],
            ),
            Card(
              elevation: 1,
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 150,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Total p/person",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, right: 5),
                          child: Text(
                            "\$",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 20),
                          ),
                        ),
                        billAmount != 0 ?
                        Text(
                          '${((billAmount+tipAmount)/split).toStringAsFixed(2)}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              letterSpacing: 5),
                        ) :Text(
                          '000',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              letterSpacing: 5),
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Total bill",style: TextStyle(fontSize: 20),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "\$",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15,
                                        color: Colors.teal[300]),
                                  ),
                                ),
                                billAmount != 0 ?
                                Text(
                                  '${billAmount + tipAmount}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.teal[300]),
                                ) : Text(
                                  '000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.teal[300]),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Total tip",style: TextStyle(fontSize: 20),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "\$",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15,
                                        color: Colors.teal[300]),
                                  ),
                                ),
                                tipAmount != 0 ?
                                Text(
                                  '$tipAmount',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.teal[300]),
                                ) : Text(
                                  '000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Colors.teal[300]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "your bill",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    width: 200,
                    child: TextField(
                      controller: billAmountController,
                      onChanged: (billAmountController){
                        billAmountController;
                        setState(() {
                            calculate(tip);
                        });
                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        filled: true,
                        enabled: true,
                        fillColor: Colors.white,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "\$",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        disabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),

            Container(
              width: double.infinity,
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height:55,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Choose",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "your tip",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap : (){
                                double tip = 0.10;
                                calculate(tip);
                                setState(() {

                                });
                              },
                              child: Container(
                                width: 60,
                                height: 55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "10",
                                      style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                                    Container(
                                      margin: EdgeInsets.only(top: 4),
                                      child: Text(
                                        "%",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap : (){
                                double tip = 0.15;
                                calculate(tip);
                                setState(() {

                                });
                              },

                              child: Container(
                                width: 60,
                                height: 55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "15",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      margin: EdgeInsets.only(top: 4),
                                      child: Text(
                                          "%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap : (){
                                double tip = 0.20;
                                calculate(tip);
                                setState(() {

                                });
                              },

                              child: Container(
                                width: 60,
                                height: 55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "20",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      margin: EdgeInsets.only(top: 4),
                                      child: Text(
                                          "%",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.teal[300],
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(child: Text("Custom tip",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),

            Container(
              height: 55,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Split",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "the total",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Container(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            /*if(split>1 && split!=0){
                            split--;
                            setState(() {

                            });}
                            else{
                            showAlert('can not be 0');
                            }*/


                            if(split == 1){
                              showAlert('Split can not be less than 1');
                            }else{
                              split--;
                              setState(() {

                              });
                            }
                          },
                          child: Container(
                            width: 60,
                            height: 55,
                            child: Center(
                              child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900)),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.teal[300],
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10)
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 55,
                          child: Center(
                            child: Text(
                                "$split",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900)),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            split++;
                            setState(() {

                            });
                          },
                          child: Container(
                            width: 60,
                            height: 55,
                            child: Center(
                              child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w900)),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.teal[300],
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

            )
          ],
        ),
      ),
    );
  }

  void calculate(double tip) {
    
    if(billAmountController.text.isEmpty ){
      showAlert('Bill amount could not be blank');
    }else {
      billAmount = double.parse(billAmountController.text);
      tipAmount = billAmount * tip;
    }
  }

  void showAlert(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP, // or TOP, CENTER
      backgroundColor: Colors.teal[300],
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
