import 'package:classico_395/GlobalState/expenso_395/app_constants.dart';
import 'package:classico_395/GlobalState/expenso_395/data/local/helper/db_helper.dart';
import 'package:classico_395/GlobalState/expenso_395/data/local/model/cat_model.dart';
import 'package:classico_395/GlobalState/expenso_395/data/local/model/expense_model.dart';
import 'package:classico_395/GlobalState/expenso_395/data/local/model/filter_expense_model.dart';
import 'package:intl/intl.dart';

class ExpenseRepository {
  DBHelper dbHelper;

  ExpenseRepository({required this.dbHelper});

  Future<bool> addExpense({required ExpenseModel expense}) async {
    return await dbHelper.addExpense(expense: expense);
  }

  Future<List<FilteredExpenseModel>> fetchAllExpenses({
    int filterType = 1,
    int? expType
  }) async {
    List<ExpenseModel> allExp = await dbHelper.fetchAllExpenses(type: expType);
    return filterExpenses(allExp: allExp, filterType: filterType);
  }

  List<FilteredExpenseModel> filterExpenses({
    required List<ExpenseModel> allExp,
    int filterType = 1,
  }) {
    ///1-> date
    ///2-> month
    ///3-> year
    ///4-> category

    List<FilteredExpenseModel> mFilteredExp = [];

    if (filterType < 4) {
      DateFormat df = DateFormat.yMMMEd();

      if (filterType == 1) {
        df = DateFormat.yMMMEd();
      } else if (filterType == 2) {
        df = DateFormat.yMMMM();
      } else if (filterType == 3) {
        df = DateFormat.y();
      }

      ///filtering
      ///date wise

      ///unique dates
      ///1
      List<String> uniqueDates = [];
      for (ExpenseModel eachExp in allExp) {
        String eachDate = df.format(
          DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.createdAt)),
        );

        if (!uniqueDates.contains(eachDate)) {
          uniqueDates.add(eachDate);
        }
      }

      ///filter by date
      for (String eachDate in uniqueDates) {
        num allAmt = 0;
        List<ExpenseModel> totalExpList = [];

        for (ExpenseModel eachExp in allExp) {
          print("eachExpAmt: ${eachExp.amount}");
          String eachExpDate = df.format(
            DateTime.fromMillisecondsSinceEpoch(int.parse(eachExp.createdAt)),
          );

          if (eachExpDate == eachDate) {
            totalExpList.add(eachExp);

            if (eachExp.expenseType == 1) {
              allAmt -= eachExp.amount;
            } else {
              allAmt += eachExp.amount;
            }
          }
        }

        mFilteredExp.add(
          FilteredExpenseModel(
            title: eachDate,
            totalAmt: allAmt,
            expList: totalExpList,
          ),
        );
      }
    } else {
      ///filter by category
      List<CategoryModel> uniqueCategories = AppConstants.mCategories;

      for (CategoryModel eachCat in uniqueCategories) {
        num eachCatAmt = 0;
        List<ExpenseModel> eachCatExpList = [];

        for (ExpenseModel eachExp in allExp) {
          if (eachExp.categoryId == eachCat.id) {
            eachCatExpList.add(eachExp);

            if (eachExp.expenseType == 1) {
              eachCatAmt -= eachExp.amount;
            } else {
              eachCatAmt += eachExp.amount;
            }
          }
        }

        if (eachCatExpList.isNotEmpty) {
          mFilteredExp.add(
            FilteredExpenseModel(
              title: eachCat.name,
              totalAmt: eachCatAmt,
              expList: eachCatExpList,
            ),
          );
        }
      }
    }

    return mFilteredExp;
  }

  ///update
  ///delete
}
