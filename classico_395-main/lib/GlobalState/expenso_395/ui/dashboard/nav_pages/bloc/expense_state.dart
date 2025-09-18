import 'package:classico_395/GlobalState/expenso_395/data/local/model/filter_expense_model.dart';
// import 'package:expenso_395/data/local/model/expense_model.dart';
// import 'package:expenso_395/data/local/model/filter_expense_model.dart';

abstract class ExpenseState {}

class ExpenseInitialState extends ExpenseState {}
class ExpenseLoadingState extends ExpenseState {}
class ExpenseLoadedState extends ExpenseState {
  List<FilteredExpenseModel> allExp;
  ExpenseLoadedState({required this.allExp});
}
class ExpenseErrorState extends ExpenseState {
  String errorMsg;
  ExpenseErrorState({required this.errorMsg});
}