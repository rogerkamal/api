import 'package:flutter/material.dart';

///// create Login page of facebook instagram

import 'package:flutter/material.dart';

class Loginscreens extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ///emailController.text = "Hello, Welcome";

    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      /*appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text("Home"),
      ),*/
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/logo/instalogo1.webp'),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabled: true,
                    hint: Text("Phone number, username or email address",style: TextStyle(color: Colors.black38),),
                    border: OutlineInputBorder(),

                    /*prefixText: "Mr./Miss ",*/

                    /*prefix: Icon(Icons.abc),*/
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  /*onChanged: (value){
                  ///search or filter
                  print(value);
                },*/
                ),

                SizedBox(height:10),
                TextField(
                  obscureText: true,
                  obscuringCharacter: "*",
                  controller: passController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.visibility_off),
                    hint: Text("Password",style: TextStyle(color: Colors.black38),textAlign: TextAlign.justify,),
                    border: OutlineInputBorder(),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  /*onChanged: (value){
                  ///search or filter
                  print(value);
                },*/
                ),
                SizedBox(height:10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgotten Password?",
                      style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                SizedBox(height:20),
                SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      print("Email: ${emailController.text}");
                    },
                    child: Text('Log in',style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Button color
                      foregroundColor: Colors.white, // Text/icon color
                      // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero // Rounded corners
                        // side: BorderSide(color: Colors.red, width: 2), // Border color and width
                      ),
                      // elevation: 5, // Shadow
                    ),
                  ),
                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      width: 130,
                      color: Colors.grey,
                    ),
                    Text("OR",style: TextStyle(),),
                    Container(
                      height: 1,
                      width: 130,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(height:30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.facebook,color: Colors.blue[700],),
                    Text(
                      "Log in with Facebook",
                      style: TextStyle(
                          color: Colors.blue[700],
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                RichText(text: TextSpan(children: [
                  TextSpan(text: "Don't have an account?",style: TextStyle(color: Colors.black38)),
                  TextSpan(text: "Sign Up",style: TextStyle(color: Colors.blue[700],fontWeight: FontWeight.bold))
                ])),
              ],
            ),
          )

        ],
      ),
    );
  }
}

/*body: Column(
children: [
ElevatedButton(onPressed: () {
print("Logged in successfully");
}, child: Text("Login")),

OutlinedButton(onPressed: (){
print("Registered successfully");
}, child: Text("Register")),

TextButton(onPressed: (){
print("Playing video");
}, child: Text("Play")),

IconButton(onPressed: (){
print("Time updated");
}, icon: Icon(Icons.access_time_outlined)),

InkWell(
onTap: (){
print("Button tapped!!");
},
child: Container(
width: 130,
height: 40,
child: Center(child: Text("My Button", style: TextStyle(color: Colors.deepPurple),)),
decoration: BoxDecoration(
///color: Colors.red,
borderRadius: BorderRadius.circular(21),
border: Border.all(
color: Colors.black,
width: 1
),
),

),
)

],
),
floatingActionButton: FloatingActionButton(
onPressed: () {
print("Button tapped!!");
},
child: Icon(Icons.add),
),*/

///Container(
//           width: 300,
//           height: 300,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             image: DecorationImage(
//                 image: NetworkImage("https://m.media-amazon.com/images/M/MV5BMmU1YWU1NmMtMjAyMi00MjFiLWFmZmUtOTc1ZjI5ODkxYmQyXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg"), fit: BoxFit.cover)
//           ),
//         ),

///ClipRRect(
//           borderRadius: BorderRadius.circular(150),
//             child: Image.network("https://m.media-amazon.com/images/M/MV5BMmU1YWU1NmMtMjAyMi00MjFiLWFmZmUtOTc1ZjI5ODkxYmQyXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg", width:300, height: 300, fit: BoxFit.cover,)),
//

///Image.asset("assets/images/bg_nature_2.jpg", ),

///Center(
//         child: Container(
//           width: 200,
//           height: 30,
//           decoration: BoxDecoration(
//               color: Colors.orange,
//               borderRadius: BorderRadius.vertical(bottom: Radius.circular(21)),
//               border: Border.all(
//                 color: Colors.black,
//                 width: 2,
//               )),
//           child: Center(
//               child: Text("fkjnvjkfrnvjnfrvjlwnvlkfnvnvkljrwnvlkwrnvlkwnr", style: TextStyle(
//                 overflow: TextOverflow.clip,
//                 decoration: TextDecoration.lineThrough
//               ),))
//         ),
//       )

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
