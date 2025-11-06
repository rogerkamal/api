import 'package:flutter/material.dart';

class HomePageResAdp extends StatelessWidget {
  MediaQueryData? mqData;

  @override
  Widget build(BuildContext context) {

    mqData = MediaQuery.of(context);
    print("W: ${mqData!.size.width}");
    print("H: ${mqData!.size.height}");

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.amber,
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              height: 100,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      )
    );

  }

  ///Center(child: SizedBox(
  //           width: mqData!.size.width*0.4,
  //           height: 40,
  //           child: FittedBox(child: Text("Hello World, Welcome to Flutter", style: TextStyle(fontSize: 30),)))),
  //

  ///mqData!.orientation==Orientation.landscape ? Center(
  //         child: Row(
  //           children: [
  //             buildUIOne(),
  //             buildUITwo(),
  //           ],
  //         ),
  //       ) : Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             buildUIOne(),
  //             buildUITwo(),
  //           ],
  //         ),
  //       )

  Widget buildUIOne(){
    return Container(
      width: mqData!.size.width*0.5,
      height: mqData!.size.height*0.3,
      color: Colors.blue,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth>constraints.maxHeight ? constraints.maxWidth>500 ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: constraints.maxWidth*0.2,
                height: constraints.maxHeight*0.9,
                color: Colors.amber,
              ),
              Container(
                width: constraints.maxWidth*0.2,
                height: constraints.maxHeight*0.9,
                color: Colors.amber,
              ),
              Container(
                width: constraints.maxWidth*0.2,
                height: constraints.maxHeight*0.9,
                color: Colors.amber,
              ),
              Container(
                width: constraints.maxWidth*0.2,
                height: constraints.maxHeight*0.9,
                color: Colors.amber,
              ),
            ],
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: constraints.maxWidth*0.4,
                height: constraints.maxHeight*0.9,
                color: Colors.amber,
              ),
              Container(
                width: constraints.maxWidth*0.4,
                height: constraints.maxHeight*0.9,
                color: Colors.amber,
              ),
            ],
          ) : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: constraints.maxWidth*0.9,
                height: constraints.maxHeight*0.4,
                color: Colors.amber,
              ),
              Container(
                width: constraints.maxWidth*0.9,
                height: constraints.maxHeight*0.4,
                color: Colors.amber,
              ),
            ],
          );
        }
      ),
    );
  }

  Widget buildUITwo(){
    return Container(
      width: mqData!.size.width*0.5,
      height: mqData!.size.height*0.3,
      color: Colors.red,
    );
  }
}

///Center(
//         child: Container(
//           width: mqData!.size.width*0.5,
//           height: mqData!.size.height*0.3,
//           color: Colors.blue,
//         ),
//       ),
