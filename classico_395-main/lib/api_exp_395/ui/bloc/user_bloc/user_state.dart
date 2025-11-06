import 'package:classico_395/api_exp_395/data/remote/model/user_model.dart';


abstract class UserState{}

class UserInitialState extends UserState{}


class UserLoadingState extends UserState{}


class UserLoadedState extends UserState{
  List<UserModel> allUsers;
  UserLoadedState({required this.allUsers});
}


class UserErrorState extends UserState{
  String errorMsg;
  UserErrorState({required this.errorMsg});
}