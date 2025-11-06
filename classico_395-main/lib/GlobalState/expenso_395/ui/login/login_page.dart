import 'package:classico_395/GlobalState/expenso_395/ui/bloc/user_bloc.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/bloc/user_event.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/bloc/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/app_routes.dart';
import '../signup/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  bool isLogin = false;
  bool isPasswordVisible = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 120),

              Text(
                'Login here!',
                style: TextStyle(
                  fontSize: 35,
                  color: Color(0XFF6D7ED2),
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Stay signed in with your account \n      to make searching easier.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),

              SizedBox(height: 30),
              Container(
                width: 350,
                height: 80,
                child: TextFormField(
                  validator: (value){
                    RegExp emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
                    if(value == null || value.isEmpty){
                      return 'Please enter email here..';
                    } else if(!emailRegex.hasMatch(value)) {
                      return 'Please enter valid email';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.text,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'user_name',
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

              Container(
                width: 350,
                height: 80,
                child: TextFormField(
                  validator: (value){

                    if(value == null || value.isEmpty){
                      return 'Please enter password here..';
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: isPasswordVisible ? false : true,
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
                    suffixIcon: InkWell(
                      onTap: (){
                        isPasswordVisible = !isPasswordVisible;
                        setState(() {});
                      },
                      child: Icon(
                        isPasswordVisible ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),
              BlocConsumer<UserBloc, UserState>(
                listenWhen: (ps, cs){
                  return isLogin;
                },
                  buildWhen: (ps, cs){
                  return isLogin;
                  },
                listener: (_, state){
                  if(state is UserLoadingState){
                    isLoading = true;
                  }

                  if(state is UserSuccessState){
                    isLoading = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Logged in Successfully..'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
                  }

                  if(state is UserFailureState){
                    isLoading = false;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Login Failed : ${state.errorMsg}'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return Container(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {

                      if(formKey.currentState!.validate()){
                        isLogin = true;
                        context.read<UserBloc>().add(
                          LogiUserEvent(email: emailController.text,
                              pass: passwordController.text),
                        );
                      }

                        /*Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => BottomBar(),
                          ),
                        );*/

                        print('login');
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
                          /// true ? Widget1 : Widget2
                          CircularProgressIndicator(color: Colors.white,),
                          SizedBox(width: 10,),
                          Text(
                            'Logging in...$isLoading',
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ) :Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }
              ),

              SizedBox(height: 40),
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

              SizedBox(height: 20),

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
                    'Log in with Gmail',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),

              SizedBox(height: 60),

              Text(
                'Forget Password?',
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),

              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ", // default text
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),

                  TextButton(
                    onPressed: () {
                      isLogin = false;
                      Navigator.pushNamed(context, AppRoutes.register);
                    },
                    child: Text(
                      'Sign UP',
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
      ),
    );
  }
}
