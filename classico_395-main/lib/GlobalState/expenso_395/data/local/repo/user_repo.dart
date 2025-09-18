// import 'package:expenso_395/data/local/helper/db_helper.dart';

import 'package:classico_395/GlobalState/expenso_395/data/local/helper/db_helper.dart';

import '../model/user_model.dart';

class UserRepository{
  DBHelper dbHelper;
  UserRepository({required this.dbHelper});

  Future<int> authenticateUser({required String email, required String pass}) async{
     int value = await dbHelper.loginUser(email: email, pass: pass);
     return value;
  }

  Future<int> registerUser({required UserModel user}) async{

    ///1 = user registered
    ///2 = user already exists
    ///3 = user registration failed

    if(await dbHelper.ifEmailExists(user.email)){
      return 2;
    } else {
      bool check = await dbHelper.registerUser(user: user);
      if(check){
        return 1;
      } else {
        return 3;
      }
    }


  }


}