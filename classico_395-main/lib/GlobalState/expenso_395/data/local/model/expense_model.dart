import '../helper/db_helper.dart';

class ExpenseModel{
  int? eid;
  int? uid;
  String title;
  String desc;
  double amount;
  double balance;
  String createdAt;
  int categoryId;
  int expenseType;

  ExpenseModel({
    this.eid,
    this.uid,
    required this.title,
    required this.desc,
    required this.amount,
    required this.balance,
    required this.createdAt,
    required this.categoryId,
    required this.expenseType,
  });

  factory ExpenseModel.fromMap(Map<String,dynamic>map){
    return ExpenseModel(
      eid: map[DBHelper.COLUMN_EXPENSE_ID],
      uid: map[DBHelper.COLUMN_USER_ID],
      title: map[DBHelper.COLUMN_EXPENSE_TITLE],
      desc: map[DBHelper.COLUMN_EXPENSE_DESC],
      amount: map[DBHelper.COLUMN_EXPENSE_AMT],
      balance: map[DBHelper.COLUMN_EXPENSE_BAL],
      createdAt: map[DBHelper.COLUMN_EXPENSE_CREATED_AT],
      categoryId: map[DBHelper.COLUMN_EXPENSE_CAT_ID],
      expenseType: map[DBHelper.COLUMN_EXPENSE_TYPE],
    );
  }

  Map<String,dynamic> toMap() => {
    ///DBHelper.COLUMN_EXPENSE_ID: eid, because it is auto increment
    DBHelper.COLUMN_USER_ID: uid,
    DBHelper.COLUMN_EXPENSE_TITLE: title,
    DBHelper.COLUMN_EXPENSE_DESC : desc,
    DBHelper.COLUMN_EXPENSE_AMT :amount,
    DBHelper.COLUMN_EXPENSE_BAL:balance,
    DBHelper.COLUMN_EXPENSE_CREATED_AT:createdAt,
    DBHelper.COLUMN_EXPENSE_CAT_ID:categoryId,
    DBHelper.COLUMN_EXPENSE_TYPE:expenseType,
  };

}


///expense
///eid(int, pk, auto)
///uid(int)
///title(text)
///description(text)
///amount(real)
///balance(real)
///createdAt(text)
///categoryId(int)
///expenseType(int) 1-> debit, 2-> credit