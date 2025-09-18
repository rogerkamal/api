
import 'package:classico_395/GlobalState/expenso_395/data/local/model/user_model.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/bloc/user_bloc.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/bloc/user_event.dart';
// import 'package:expenso_395/data/local/model/user_model.dart';
// import 'package:expenso_395/ui/bloc/user_bloc.dart';
// import 'package:expenso_395/ui/bloc/user_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController mobNoController = TextEditingController();
    TextEditingController genderController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/app_image/logo.png",height: 30,fit: BoxFit.contain,),
                SizedBox(width: 5,),
                Text('Monety',style: TextStyle(
                    color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold
                ),)
              ],
            ),

            SizedBox(height: 50),
            SizedBox(
              width: 350,
              height: 80,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(
                    CupertinoIcons.profile_circled,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 350,
              height: 80,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(
                    CupertinoIcons.profile_circled,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 350,
              height: 80,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: mobNoController,
                decoration: InputDecoration(
                  labelText: 'Mobile number',
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(
                    CupertinoIcons.profile_circled,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 350,
              height: 80,
              child: TextField(
                keyboardType: TextInputType.text,
                controller: genderController,
                decoration: InputDecoration(
                  labelText: 'Gender',
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(
                    CupertinoIcons.profile_circled,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

            SizedBox(
              width: 350,
              height: 80,
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: Icon(
                    CupertinoIcons.eye_slash,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: 350,
              height: 50,
              child: BlocConsumer<UserBloc, UserState>(
                listener: (_, state){

                  if(state is UserLoadingState){
                    isLoading = true;
                  }

                  if(state is UserSuccessState){
                    isLoading = false;
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully Registered"), backgroundColor: Colors.green,));
                  }

                  if(state is UserFailureState){
                    isLoading = false;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg), backgroundColor: Colors.red,));
                  }


                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
                      // Add your sign up logic here

                      if(nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty || mobNoController.text.isEmpty || genderController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields"), backgroundColor: Colors.red,));
                        return;
                      }

                      UserModel user = UserModel(
                          name: nameController.text,
                          email: emailController.text.trim(),
                          pass: passwordController.text.trim(),
                          mobNo: mobNoController.text.trim(),
                          gender: genderController.text.trim(),
                          createdAt: DateTime.now().millisecondsSinceEpoch.toString());

                      context.read<UserBloc>().add(RegisterUserEvent(user: user));

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFF6D7ED2),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isLoading ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.white,),
                        SizedBox(width: 10,),
                        Text(
                          'Signing Up...',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ) : Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }
              ),
            ),

            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 1, width: 130, color: Colors.grey),
                Text(
                  'OR',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 18),
                ),
                Container(height: 1, width: 130, color: Colors.grey),
              ],
            ),

            SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    'assets/app_image/icons8-gmail-48 (1).png',
                    height: 40,
                    width: 40,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  'Sign Up with Gmail',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ", // default text
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),

                TextButton(
                  onPressed: () {
                   Navigator.pop(context);
                  },
                  child: Text(
                    'Log In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
