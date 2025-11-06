import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

void main() {
  runApp(const ContainerDecorMain());
}

class ContainerDecorMain extends StatelessWidget {
  const ContainerDecorMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Decor'),
      ),
      body: Center(
        child: Container(

          /*child:ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: [
                Colors.purple,
                Colors.orange,
                Colors.green
              ],
            ).createShader(bounds),
            child: Center(
              child: Text(
                'Flutter Text Gradient',
                style: TextStyle(color: Colors.white, fontSize: 40,fontWeight: FontWeight.bold),
              ),
            ),
          ),*/

          decoration: BoxDecoration(
            //borderRadius: BorderRadius.circular(21),
            gradient: LinearGradient(
              stops: [0.0, 0.3, 0.7],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xffff9a01),
                  Color(0xfffad100),
                  Color(0xff009dff)
            ])


            /*gradient:RadialGradient(
                colors: [
                  Colors.yellow,
                  Colors.red,
                  Colors.indigo
                ],
                radius: 0.8,
                // center: Alignment.topRight,

          ),*/


            /*gradient: SweepGradient(
              colors: [
                Colors.deepPurple,
                Colors.blue,
                Colors.green,
                Colors.yellowAccent,
                Colors.red,
                Colors.deepPurple,

              ],
              center: Alignment.center,
              startAngle: 0.0,
              endAngle: 3.14 * 2, // Full circle
            )*/


          ),
        ),
      ),

    );
  }
}

/*Center(
        child: Column(
          children: [
            Card(
              elevation: 21,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21)
              ),
              color: Colors.white,
              child: Container(
                width: 200,
                height: 200,
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.circular(21),
                boxShadow: [

                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 21,
                    spreadRadius: 2,
                    offset: Offset(11,11)
                  ),
                  /*BoxShadow(
                      color: Colors.white,
                      blurRadius: 21,
                      spreadRadius: 5,
                      offset: Offset(-5, 5)
                  ),*/

                ]
              ),
            ),
          ],
        ),
      )*/

