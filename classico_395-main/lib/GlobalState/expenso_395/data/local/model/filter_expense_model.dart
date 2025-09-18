import 'expense_model.dart';

class FilteredExpenseModel {

  String title;
  num totalAmt;
  List<ExpenseModel> expList;

  FilteredExpenseModel({
    required this.title,
    required this.totalAmt,
    required this.expList,
  });

}
