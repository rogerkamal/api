import 'package:classico_395/GlobalState/expenso_395/app_constants.dart';
import 'package:classico_395/GlobalState/expenso_395/data/local/model/cat_model.dart';
import 'package:classico_395/GlobalState/expenso_395/data/local/model/expense_model.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/bloc/expense_bloc.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/bloc/expense_event.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/bloc/expense_state.dart';
import 'package:classico_395/GlobalState/expenso_395/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class AddExpensePage extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController amtController = TextEditingController();

  int selectedCatIndex = -1;
  DateTime? selectedDate;
  DateFormat dateFormat = DateFormat.yMMMEd();
  List<String> expType = ["Debit", "Credit"];
  String selectedExpType = "Debit";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Expense")),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [

            ///title
            TextField(
              controller: titleController,
              decoration: UIHelper.getMyTextFieldDecoration(
                labelTxt: "Title",
                hintTxt: "Enter your title here..",
                prefixIcon: Icons.title,
              ),
            ),
            SizedBox(height: 11),

            ///description
            TextField(
              controller: descController,
              decoration: UIHelper.getMyTextFieldDecoration(
                labelTxt: "Description",
                hintTxt: "Enter your description here..",
                prefixIcon: Icons.description,
              ),
            ),
            SizedBox(height: 11),

            ///amount
            TextField(
              controller: amtController,
              decoration: UIHelper.getMyTextFieldDecoration(
                labelTxt: "Amount",
                hintTxt: "Enter your amount here..",
                prefixIcon: Icons.money,
              ),
            ),
            SizedBox(height: 11),

            StatefulBuilder(
                builder: (context, ss) {
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      maximumSize: Size(double.infinity, 55),
                      minimumSize: Size(double.infinity, 55),
                      side: BorderSide(color: Colors.purple, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              itemCount: AppConstants.mCategories.length,
                              itemBuilder: (_, index) {
                                CategoryModel eachCat = AppConstants
                                    .mCategories[index];

                                return InkWell(
                                  onTap: () {
                                    selectedCatIndex = index;
                                    ss(() {});
                                    Navigator.pop(context);
                                  },
                                  child: Column(
                                    children: [
                                      Image.asset(eachCat.imgPath, width: 50,
                                        height: 50,),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Text(eachCat.name),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                    child: selectedCatIndex >= 0 ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(AppConstants
                              .mCategories[selectedCatIndex].imgPath),
                        ),
                        Text(" - ${AppConstants.mCategories[selectedCatIndex]
                            .name}")
                      ],
                    ) : Text("Choose Category"),
                  );
                }
            ),

            SizedBox(height: 11),

            StatefulBuilder(
                builder: (context, ss) {
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      maximumSize: Size(double.infinity, 55),
                      minimumSize: Size(double.infinity, 55),
                      side: BorderSide(color: Colors.purple, width: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      selectedDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now().subtract(Duration(days: 366)),
                        lastDate: DateTime.now(),
                        barrierDismissible: false,
                        barrierColor: Colors.purple.withOpacity(0.2),
                      );
                      ss(() {});
                    },
                    child: Text(
                        dateFormat.format(selectedDate ?? DateTime.now())),
                  );
                }
            ),

            SizedBox(height: 11),

            /*StatefulBuilder(
              builder: (context, ss) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: expType.map((e){
                    return RadioMenuButton(
                        value: e,
                        groupValue: selectedExpType,
                        onChanged: (value){
                          selectedExpType = value!;
                          ss((){});
                        },
                        child: Text(e));
                  }).toList()
                );
              }
            ),*/

            DropdownMenu(
                width: double.infinity,
                label: Text("Type"),
                inputDecorationTheme: InputDecorationTheme(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.purple, width: 2),
                  ),
                ),
                initialSelection: selectedExpType,
                onSelected: (value){
                  selectedExpType = value!;
                },
                dropdownMenuEntries: expType.map((e) {
                  return DropdownMenuEntry(value: e, label: e);
                }).toList()),

            SizedBox(height: 11),

            SizedBox(
              width: double.infinity,
              height: 53,
              child: BlocConsumer<ExpenseBloc, ExpenseState>(
                listener: (_, state){

                  if(state is ExpenseLoadingState){
                    isLoading = true;
                  }

                  if(state is ExpenseLoadedState){
                    isLoading = false;
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Expense Added"), backgroundColor: Colors.green,));
                  }

                  if(state is ExpenseErrorState){
                    isLoading = false;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMsg), backgroundColor: Colors.red,));
                  }

                },
                builder: (context, state) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.pink.shade200,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      ExpenseModel myExp = ExpenseModel(
                          title: titleController.text,
                          desc: descController.text,
                          amount: double.parse(amtController.text),
                          balance: 0,
                          createdAt: (selectedDate ?? DateTime.now()).millisecondsSinceEpoch.toString(),
                          categoryId: AppConstants.mCategories[selectedCatIndex].id,
                          expenseType: selectedExpType=="Debit" ? 1 : 2);

                      context.read<ExpenseBloc>().add(AddExpenseEvent(newExp: myExp));
                    },
                    child: isLoading ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(color: Colors.white,),
                        SizedBox(width: 11,),
                        Text("Adding, Please Wait...")
                      ],
                    ) : Text('Add Expense'),
                  );
                }
              ),
            )

            /*StatefulBuilder(
              builder: (context, ss) {
                return DropdownButton(
                  value: selectedExpType,
                    items: expType.map((e){
                  return DropdownMenuItem(value: e,child: Text(e),);
                }).toList(), onChanged: (value){
                  selectedExpType = value ?? "Debit";
                  ss((){});
                });
              }
            )*/

            ///category
            ///date
            ///type
          ],
        ),
      ),
    );
  }
}
