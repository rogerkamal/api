import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Home"),
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(21)),
              border: Border.all(
                color: Colors.black,
                width: 2,
              )),
          child: Center(
              child: Text("fkjnvjkfrnvjnfrvjlwnvlkfnvnvkljrwnvlkwrnvlkwnr", style: TextStyle(
                overflow: TextOverflow.clip,
              ),))
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Button tapped!!");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
///RichText(text: TextSpan(children: [
//                 TextSpan(
//                   text: "Hello",
//                     style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "poppins"
//                     )
//                 ),
//                 TextSpan(
//                   text: " Flutter Future",
//                   style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     fontFamily: "chewy",
//                     color: Colors.black,
//                     /*
//                     letterSpacing: 5,
//                     wordSpacing: 25*/
//                   )
//                 ),
//                 TextSpan(text: " Dev",)
//               ]))),
///Text(
//             'Hello Flutter Dev',
//             style: TextStyle(
//               fontSize: 21,
//               fontWeight: FontWeight.w900,
//               color: Colors.white,
//               fontFamily: "chewy",
//             ),
//           )


///Named constructor syntax declaration:
/*class User extends Employee{

  int? employeeId;
  String? name;
  String? email;
  String? mobNo;

  User.withEmail({required this.employeeId, required this.name, this.email}) : super(eid: employeeId!);

  User.withMobNo({required this.name, this.mobNo});


}

class Employee{

  int eid;
  Employee({required this.eid});

}*/
