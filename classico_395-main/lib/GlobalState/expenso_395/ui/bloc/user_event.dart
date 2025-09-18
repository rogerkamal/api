import 'package:classico_395/GlobalState/expenso_395/data/local/model/user_model.dart';

abstract class UserEvent {}

class LogiUserEvent extends UserEvent {
  String email, pass;
  LogiUserEvent({required this.email, required this.pass});
}

class RegisterUserEvent extends UserEvent {
  UserModel user;
  RegisterUserEvent({required this.user});
}