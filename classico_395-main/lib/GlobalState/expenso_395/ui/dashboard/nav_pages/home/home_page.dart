import 'dart:math';
import 'package:classico_395/GlobalState/expenso_395/app_constants.dart' show AppConstants;
import 'package:classico_395/GlobalState/expenso_395/data/local/model/expense_model.dart';
import 'package:classico_395/GlobalState/expenso_395/data/local/model/filter_expense_model.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/bloc/expense_bloc.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/bloc/expense_event.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/bloc/expense_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> mFilter  = ["DateWise", "MonthWise", "YearWise", "CategoryWise"];
  List<String> options = ["All","Expense","Income"];
  int selectedOptionIndex = 0;
  String selectedFilter = "DateWise";
  bool onlyIncome = false;
  int filterTypeValue = 1;
  final List<Map<String, dynamic>> expenses = [
    {
      'icon': Icons.phone,
      'title': 'Electronic',
      'subtitle': 'Buy new iphone 14',
      'amount': 1290,
      "color": Colors.orangeAccent.withOpacity(.2),
    },
    {
      'icon': Icons.shopping_cart,
      'title': 'Shop',
      'subtitle': 'Buy new clothes',
      'amount': 90,
      "color": Colors.blue.withOpacity(.2),
    },
  ];

  final List<Map<String, dynamic>> expensesList = [
    {
      'icon': Icons.car_crash_outlined,
      'title': 'Transportation',
      'subtitle': 'trip to Malang',
      'amount': 60,
      "color": Colors.redAccent.withOpacity(.2),
    },
  ];

  MediaQueryData? mqData;

  @override
  void initState() {
    super.initState();
    context.read<ExpenseBloc>().add(FetchAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);

    return Scaffold(
      body: mqData!.orientation==Orientation.landscape ? Padding(padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // Row with logo
                    Row(
                      children: [
                        Image.asset(
                          "assets/app_image/logo.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 8), // optional spacing
                        const Text(
                          "Monety",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "Bold",
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.search, size: 35),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // ListTile with aligned profile image
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 0, right: 0),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.yellow,
                        child: Image.asset(
                          "assets/app_image/ic_avatar.png",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: const Text(
                        "James",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Regular",
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: const Text(
                        "Vashundra Vihar colony",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Regular",
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      trailing: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 11),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.blueAccent.withOpacity(.2),
                          ),
                          child: StatefulBuilder(
                              builder: (context, ss) {
                                return DropdownButton(
                                    underline: Container(),
                                    value: selectedFilter,
                                    items: mFilter.map((e){
                                      return DropdownMenuItem(value: e,child: Text(e),);
                                    }).toList(), onChanged: (value){
                                  selectedFilter = value ?? "DateWise";


                                  if(selectedFilter=="DateWise"){
                                    filterTypeValue = 1;
                                  } else if(selectedFilter=="MonthWise"){
                                    filterTypeValue = 2;
                                  } else if(selectedFilter=="YearWise"){
                                    filterTypeValue = 3;
                                  } else {
                                    filterTypeValue = 4;
                                  }

                                  context.read<ExpenseBloc>().add(FetchAllExpenseEvent(filterType: filterTypeValue));

                                  ss((){});
                                });
                              }
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Card(
                          elevation: 3,
                          // shape: RoundedRectangleBorder(),
                          child: Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expense total",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: "Regular",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "\$3,734",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontFamily: "Bold",
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  SizedBox(height: 10),

                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: Colors.deepOrange,
                                        ),
                                        child: Text(
                                          "+\$240",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontFamily: "Regular",
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "than last month",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontFamily: "Regular",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 35,
                          child: Image.asset(
                            "assets/app_image/ic_home_pie.png",
                            width: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // Row with logo
                    Row(
                      children: [
                        Image.asset(
                          "assets/app_image/logo.png",
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 8), // optional spacing
                        const Text(
                          "Monety",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: "Bold",
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.search, size: 35),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // ListTile with aligned profile image
                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 0, right: 0),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.yellow,
                        child: Image.asset(
                          "assets/app_image/ic_avatar.png",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: const Text(
                        "James",
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Regular",
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: const Text(
                        "Vashundra Vihar colony",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Regular",
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      trailing: Container(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 11),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.blueAccent.withOpacity(.2),
                          ),
                          child: StatefulBuilder(
                              builder: (context, ss) {
                                return DropdownButton(
                                    underline: Container(),
                                    value: selectedFilter,
                                    items: mFilter.map((e){
                                      return DropdownMenuItem(value: e,child: Text(e),);
                                    }).toList(), onChanged: (value){
                                  selectedFilter = value ?? "DateWise";


                                  if(selectedFilter=="DateWise"){
                                    filterTypeValue = 1;
                                  } else if(selectedFilter=="MonthWise"){
                                    filterTypeValue = 2;
                                  } else if(selectedFilter=="YearWise"){
                                    filterTypeValue = 3;
                                  } else {
                                    filterTypeValue = 4;
                                  }

                                  context.read<ExpenseBloc>().add(FetchAllExpenseEvent(filterType: filterTypeValue));

                                  ss((){});
                                });
                              }
                          )
                      ),
                    ),
                    SizedBox(height: 20),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Card(
                          elevation: 3,
                          // shape: RoundedRectangleBorder(),
                          child: Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expense total",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontFamily: "Regular",
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "\$3,734",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                      fontFamily: "Bold",
                                      fontWeight: FontWeight.normal,
                                      letterSpacing: 2,
                                    ),
                                  ),
                                  SizedBox(height: 10),

                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 5,
                                          vertical: 3,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(3),
                                          color: Colors.deepOrange,
                                        ),
                                        child: Text(
                                          "+\$240",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontFamily: "Regular",
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "than last month",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontFamily: "Regular",
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 35,
                          child: Image.asset(
                            "assets/app_image/ic_home_pie.png",
                            width: 190,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )):Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Row with logo
            Row(
              children: [
                Image.asset(
                  "assets/app_image/logo.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 8), // optional spacing
                const Text(
                  "Monety",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: "Bold",
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.2,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.search, size: 35),
              ],
            ),
            const SizedBox(height: 10),
            // ListTile with aligned profile image
            ListTile(
              contentPadding: const EdgeInsets.only(left: 0, right: 0),
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.yellow,
                child: Image.asset(
                  "assets/app_image/ic_avatar.png",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              title: const Text(
                "James",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Regular",
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: const Text(
                "Vashundra Vihar colony",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "Regular",
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
              trailing: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.blueAccent.withOpacity(.2),
                ),
                child: StatefulBuilder(
                    builder: (context, ss) {
                      return DropdownButton(
                        underline: Container(),
                          value: selectedFilter,
                          items: mFilter.map((e){
                            return DropdownMenuItem(value: e,child: Text(e),);
                          }).toList(), onChanged: (value){
                        selectedFilter = value ?? "DateWise";


                        if(selectedFilter=="DateWise"){
                          filterTypeValue = 1;
                        } else if(selectedFilter=="MonthWise"){
                          filterTypeValue = 2;
                        } else if(selectedFilter=="YearWise"){
                          filterTypeValue = 3;
                        } else {
                          filterTypeValue = 4;
                        }

                        context.read<ExpenseBloc>().add(FetchAllExpenseEvent(filterType: filterTypeValue));

                        ss((){});
                      });
                    }
                )
              ),
            ),
            SizedBox(height: 20),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Card(
                  elevation: 3,
                  // shape: RoundedRectangleBorder(),
                  child: Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Expense total",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Regular",
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "\$3,734",
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                              fontFamily: "Bold",
                              fontWeight: FontWeight.normal,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(height: 10),

                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: Colors.deepOrange,
                                ),
                                child: Text(
                                  "+\$240",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontFamily: "Regular",
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "than last month",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontFamily: "Regular",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 35,
                  child: Image.asset(
                    "assets/app_image/ic_home_pie.png",
                    width: 190,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Expense List",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: "Regular",
                    fontWeight: FontWeight.w900,
                  ),
                ),
                /*Switch(value: onlyIncome, onChanged: (value){
                  onlyIncome = value;
                  context.read<ExpenseBloc>().add(FetchAllExpenseEvent(filterType: filterTypeValue,expType: onlyIncome ? 2 : 1));
                  setState(() {});
                })*/
                InkWell(
                  onTap: (){
                    if(selectedOptionIndex<options.length-1) {
                      selectedOptionIndex++;
                    } else {
                      selectedOptionIndex = 0;
                    }
                    int? expType;
                    if(selectedOptionIndex==1) {
                     expType = 1;
                    } else if(selectedOptionIndex==2){
                      expType = 2;
                    }

                    context.read<ExpenseBloc>().add(FetchAllExpenseEvent(
                        filterType: filterTypeValue,
                        expType: expType));
                    setState(() {

                    });

                  },
                    child: Text(options[selectedOptionIndex], style: TextStyle(fontSize: 16),))
              ],
            ),
            SizedBox(height: 10),

            /*Container(
              // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside, // Needs Flutter 3.10+
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Tuesday, 14",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "-\$1380",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  const Divider(thickness: 1.5, height: 20),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: expenses.length,
                    itemBuilder: (context, index) {
                      final expense = expenses[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color:expense["color"],
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(expense['icon'], color: Colors.blue),
                        ),
                        title: Text(expense['title'],  style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),),
                        subtitle: Text(expense['subtitle'],  style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),),
                        trailing: Text("-\$${expense['amount']}",  style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignInside, // Needs Flutter 3.10+
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Monday, 13",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        "-\$60",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  const Divider(thickness: 1.5, height: 20),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: expensesList.length,
                    itemBuilder: (context, index) {
                      final expenseList = expensesList[index];
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color:expenseList["color"],
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(expenseList['icon'], color: Colors.blue),
                        ),
                        title: Text(expenseList['title'],  style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),),
                        subtitle: Text(expenseList['subtitle'],  style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),),
                        trailing: Text("-\$${expenseList['amount']}",  style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),),
                      );
                    },
                  ),
                ],
              ),
            ),*/
            Expanded(
              child: BlocBuilder<ExpenseBloc, ExpenseState>(
                builder: (_, state) {
                  if (state is ExpenseLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is ExpenseErrorState) {
                    return Center(child: Text(state.errorMsg));
                  }

                  if (state is ExpenseLoadedState) {
                    return state.allExp.isNotEmpty
                        ? ListView.builder(
                            padding: EdgeInsets.zero,
                            itemCount: state.allExp.length,
                            itemBuilder: (_, index) {
                              FilteredExpenseModel eachFilterExp =
                                  state.allExp[index];

                              return Container(
                                padding: EdgeInsets.all(14),
                                margin: EdgeInsets.only(bottom: 11),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          eachFilterExp.title,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "\$${eachFilterExp.totalAmt}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.black12,
                                      thickness: 2,
                                    ),
                                    ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: eachFilterExp.expList.length,
                                      itemBuilder: (_, childIndex) {
                                        ExpenseModel expense =
                                            eachFilterExp.expList[childIndex];

                                        String imgPath = AppConstants
                                            .mCategories
                                            .firstWhere((eachCat) {
                                              return eachCat.id ==
                                                  expense.categoryId;
                                            })
                                            .imgPath;

                                        return ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          leading: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              color: Colors
                                                  .primaries[Random().nextInt(
                                                    Colors.primaries.length,
                                                  )]
                                                  .shade200,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Image.asset(imgPath),
                                            ),
                                          ),
                                          title: Text(
                                            expense.title,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),
                                          ),
                                          subtitle: Text(
                                            expense.desc,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          trailing: Text(
                                            "${expense.expenseType==1?"-":"+"}\$${expense.amount}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: expense.expenseType==1?Colors.redAccent:Colors.green,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Center(child: Text("No Expenses Yet!!"));
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
