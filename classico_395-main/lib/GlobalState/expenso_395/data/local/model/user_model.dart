
import 'package:classico_395/GlobalState/expenso_395/data/local/helper/db_helper.dart';

class UserModel {
  int? uid;
  String name;
  String email;
  String pass;
  String mobNo;
  String gender;
  String createdAt;

  UserModel({
    this.uid,
    required this.name,
    required this.email,
    required this.pass,
    required this.mobNo,
    required this.gender,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
      uid: map[DBHelper.COLUMN_USER_ID],
      name: map[DBHelper.COLUMN_USER_NAME],
      email: map[DBHelper.COLUMN_USER_EMAIL],
      pass: map[DBHelper.COLUMN_USER_PASS],
      mobNo: map[DBHelper.COLUMN_USER_MOB_NO],
      gender: map[DBHelper.COLUMN_USER_GENDER],
      createdAt: map[DBHelper.COLUMN_USER_CREATED_AT],
    );
  }

  Map<String, dynamic> toMap() => {
    DBHelper.COLUMN_USER_NAME : name,
    DBHelper.COLUMN_USER_EMAIL : email,
    DBHelper.COLUMN_USER_PASS : pass,
    DBHelper.COLUMN_USER_CREATED_AT : createdAt,
    DBHelper.COLUMN_USER_GENDER : gender,
    DBHelper.COLUMN_USER_MOB_NO : mobNo,
  };

}
