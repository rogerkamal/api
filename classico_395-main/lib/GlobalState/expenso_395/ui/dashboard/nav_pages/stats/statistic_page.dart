import 'dart:math';

import 'package:classico_395/GlobalState/expenso_395/data/local/model/filter_expense_model.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/bloc/expense_bloc.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/bloc/expense_event.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/dashboard/nav_pages/bloc/expense_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  final List<double> widths = [100, 75, 65, 50, 42, 42];
  List<String> mFilter = ["DateWise", "MonthWise", "YearWise", "CategoryWise"];
  int filterTypeValue = 1;

  String selectedFilter = "DateWise";
  // String selectedFilter = "YearWise";

  ///use blocbuider as in homepage expense list to get data
  ///eachFilterExp.title ; eachFilterExp.totalAmt
  List<FilteredExpenseModel> mData = [
    FilteredExpenseModel(title: "Mon", totalAmt: 1000, expList: []),
    FilteredExpenseModel(title: "Tue", totalAmt: 1500, expList: []),
    FilteredExpenseModel(title: "Wed", totalAmt: 1900, expList: []),
    FilteredExpenseModel(title: "Thr", totalAmt: 800, expList: []),
    FilteredExpenseModel(title: "Fri", totalAmt: 2200, expList: []),
    FilteredExpenseModel(title: "Sat", totalAmt: 1200, expList: []),
    FilteredExpenseModel(title: "Sun", totalAmt: 500, expList: []),
  ];
  List<BarChartGroupData> barData = [];

  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
  ];
  final List<String> percentages = ["40%", "25%", "15%", "10%", "5%", "5%"];
  final List<Map<String, dynamic>> Expenses = [
    {
      'icon': Icons.phone,
      'title': 'Electronic',
      'amount': 1290,
      "color": Colors.orangeAccent.withOpacity(.2),
    },
    {
      'icon': Icons.shopping_cart,
      'title': 'Shop',
      'amount': 90,
      "color": Colors.blue.withOpacity(.2),
    },
    {
      'icon': Icons.car_crash_outlined,
      'title': 'Transportation',
      'amount': 60,
      "color": Colors.redAccent.withOpacity(.2),
    },
    {
      'icon': Icons.phone,
      'title': 'Electronic',
      'amount': 1290,
      "color": Colors.orangeAccent.withOpacity(.2),
    },
    {
      'icon': Icons.shopping_cart,
      'title': 'Shop',
      'amount': 90,
      "color": Colors.blue.withOpacity(.2),
    },
    {
      'icon': Icons.car_crash_outlined,
      'title': 'Transportation',
      'amount': 60,
      "color": Colors.redAccent.withOpacity(.2),
    },
  ];

  @override
  Widget build(BuildContext context) {
/*    barData = [];
    for (int i = 0; i < mData.length; i++) {
      barData.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: mData[i].totalAmt.toDouble(),
              color: Colors.white,
              width: 20,
              borderRadius: BorderRadius.vertical(top: Radius.circular(2)),
            ),
          ],
        ),
      );
    }*/

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Statistic",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Bold",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Container(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.blueAccent.withOpacity(.2),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            "This month",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "Regular",
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Card(
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " Total expense",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: "Regular",
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Icon(Icons.menu, color: Colors.white),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "\$3,734",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontFamily: "Bold",
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 2,
                                ),
                              ),
                              WidgetSpan(child: SizedBox(width: 10)),
                              TextSpan(
                                text: " /\$4000 per month",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontFamily: "Regular",
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Stack(
                        children: [
                          Card(
                            elevation: 3,
                            child: Container(
                              width: double.infinity,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  bottomLeft: Radius.circular(5),
                                ),
                                color: Colors.blueAccent.shade100,
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              width: 260,
                              height: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.yellow,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  "Expense Breakdown",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Regular",
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Limit \$900 / week",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Regular",
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                trailing: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.blueAccent.withOpacity(.2),
                    ),
                    child: /*Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        "Week",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Regular",
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.black,
                      ),
                    ],
                  ),*/

                        StatefulBuilder(builder: (context, ss) {
                      return DropdownButton(
                          underline: Container(),
                          value: selectedFilter,
                          items: mFilter.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                          onChanged: (value) {
                            selectedFilter = value ?? "DateWise";

                            if (selectedFilter == "DateWise") {
                              filterTypeValue = 1;
                            } else if (selectedFilter == "MonthWise") {
                              filterTypeValue = 2;
                            } else if (selectedFilter == "YearWise") {
                              filterTypeValue = 3;
                            } else {
                              filterTypeValue = 4;
                            }

                            context.read<ExpenseBloc>().add(
                                FetchAllExpenseEvent(
                                    filterType: filterTypeValue));

                            ss(() {});
                          });
                    })),
              ),
              SizedBox(height: 10),

              BlocBuilder<ExpenseBloc, ExpenseState>(builder: (_, state) {
                if (state is ExpenseLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is ExpenseErrorState) {
                  return Center(
                    child: Text(state.errorMsg),
                  );
                }

                if (state is ExpenseLoadedState) {

                  if (selectedFilter == "YearWise") {
                    barData = [];
                    for (int i = 0; i < state.allExp.length; i++) {
                      /*FilteredExpenseModel eachFilterExp =
                    state.allExp[i.toInt()];*/
                      barData.add(
                        BarChartGroupData(
                          x: i,
                          barRods: [
                            BarChartRodData(
                              toY: state.allExp[i].totalAmt.toDouble().abs(),
                              color: Colors.white,
                              width: 20,
                              borderRadius:
                              BorderRadius.vertical(top: Radius.circular(2)),
                            ),
                          ],
                        ),
                      );
                    }


                    return state.allExp.isNotEmpty
                        ? Container(
                            height: 200,
                            padding: EdgeInsets.only(
                                top: 16, left: 7, right: 7, bottom: 7),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.pink.shade200,
                            ),
                            child: /*PieChart(PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 1000,
                      color: Colors.white,
                      radius: 50,
                    ),
                    PieChartSectionData(
                      value: 2000,
                      color: Colors.white,
                      radius: 60,
                    ),
                    PieChartSectionData(
                      value: 4000,
                      color: Colors.white,
                      radius: 70,
                    )
                  ]
                )),*/

                                BarChart(BarChartData(
                                    // maxY: 1000000,
                                    barGroups: barData,
                                    gridData: FlGridData(show: false),
                                    titlesData: FlTitlesData(
                                        bottomTitles: AxisTitles(
                                            sideTitles: SideTitles(
                                                showTitles: true,
                                                getTitlesWidget: (index, meta) {
                                                  /*FilteredExpenseModel eachFilterExp =
                                          state.allExp[index.toInt()];*/
                                                  return Text(state
                                                      .allExp[index.toInt()]
                                                      .title);
                                                }))))),

                            ///show graph using manually customized ui
                            /*Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: 20,
                        height: 100,
                        color: Colors.white,
                      ),
                      Container(
                        width: 20,
                        height: 150,
                        color: Colors.white,
                      ),
                      Container(
                        width: 20,
                        height: 120,
                        color: Colors.white,
                      ),
                      Container(
                        width: 20,
                        height: 80,
                        color: Colors.white,
                      ),
                      Container(
                        width: 20,
                        height: 50,
                        color: Colors.white,
                      ),
                      Container(
                        width: 20,
                        height: 140,
                        color: Colors.white,
                      ),
                      Container(
                        width: 20,
                        height: 110,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Divider(
                    height: 1,
                    color: Colors.white,
                  )
                ],
              ),*/
                          )
                        : Center(
                            child: Text("No Expenses Yet!!"),
                          );
                  } else if (selectedFilter == "DateWise") {
                      /*for (int i = 0; i < state.allExp.length; i++) {
                        FilteredExpenseModel eachFilterExp =
                                          state.allExp[i.toInt()];

                      }*/
                      List<PieChartSectionData> getSections() {
                        return state.allExp.map((data) {
                          return PieChartSectionData(
                            value: data.totalAmt.toDouble(),
                            // title: '${data.title.split(",")[0]}, ${data.title.split(",")[1]}',
                            title: '${data.title.split(",")[1]}',
                            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                            radius: 60,
                            titleStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
                          );
                        }).toList();
                      }



                    return state.allExp.isNotEmpty
                        ? Container(
                            height: 200,
                            padding: EdgeInsets.only(
                                top: 16, left: 7, right: 7, bottom: 7),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.pink.shade200,
                            ),
                            child: PieChart(PieChartData(sections:

                            /*[
                              PieChartSectionData(
                                value: 1000,
                                color: Colors.white,
                                radius: 50,
                              ),
                              PieChartSectionData(
                                value: 2000,
                                color: Colors.white,
                                radius: 60,
                              ),
                              PieChartSectionData(
                                value: 4000,
                                color: Colors.white,
                                radius: 70,
                              )
                            ],*/
                            getSections(),
                              centerSpaceRadius: 40,
                              sectionsSpace: 2,)
                            ),
                          )
                        : Center(
                            child: Text("No Expenses Yet!!"),
                          );
                  }
                ///CategoryWise ScatterChart
                  else if (selectedFilter == "CategoryWise") {

                    List<Map<String, dynamic>> scatterData = [];
                    for (int i = 0; i < state.allExp.length; i++) {
                      ///data with string x-axis labels
                      scatterData.add({
                        "title": state.allExp[i].title,
                        "totalAmt": state.allExp[i].totalAmt.abs()
                      });
                      }

                    /// Map strings to numbers (index)
                    final Map<String, double> xLabelToValue = {
                      for (int i = 0; i < scatterData.length; i++) scatterData[i]['title']: i.toDouble()
                    };


                    /// Convert to ScatterSpot
                    final List<ScatterSpot> spots = scatterData.map((point) {
                      final double x = xLabelToValue[point['title']]!;
                      final double y = point['totalAmt'];
                      return ScatterSpot(x, y);
                    }).toList();

                    return state.allExp.isNotEmpty
                        ? Container(
                      height: 200,
                      padding: EdgeInsets.only(
                          top: 16, left: 7, right: 7, bottom: 7),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.pink.shade200,
                      ),
                      child: ScatterChart(
                        ScatterChartData(

                        scatterSpots: spots,
                          // maxY: 500000,
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(show: true),
                          titlesData: FlTitlesData(
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  /// Convert numeric X back to string
                                  final label = scatterData[value.toInt()]['title'];
                                  return Text(
                                    label,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                            )
                          )


                        ),
                        duration: Duration(milliseconds: 150), // Optional
                        curve: Curves.linear, // Optional
                      )
                    )
                        : Center(
                      child: Text("No Expenses Yet!!"),
                    );
                  }

                }

                return Container();
              }),

              //statistic image
              SizedBox(height: 30),
              Text(
                "Spending Details",
                style: TextStyle(fontSize: 18, fontFamily: "Bold"),
              ),
              SizedBox(height: 5),
              Text(
                "Your expense is divided into 6 categories",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: "Regular",
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widths.length,
                  itemBuilder: (context, index) {
                    final isFirst = index == 0;
                    final isLast = index == widths.length - 1;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: widths[index],
                          height: 15,
                          decoration: BoxDecoration(
                            color: colors[index],
                            borderRadius: BorderRadius.only(
                              topLeft:
                                  isFirst ? Radius.circular(10) : Radius.zero,
                              bottomLeft:
                                  isFirst ? Radius.circular(10) : Radius.zero,
                              topRight:
                                  isLast ? Radius.circular(10) : Radius.zero,
                              bottomRight:
                                  isLast ? Radius.circular(10) : Radius.zero,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(percentages[index]),
                      ],
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 20),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: Expenses.length,
                  itemBuilder: (_, index) {
                    final expense = Expenses[index];
                    return Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: ListTile(
                          leading: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: expense["color"],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(expense['icon'], color: Colors.blue),
                          ),
                          title: Text(
                            expense["title"],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Regular",
                            ),
                          ),
                          subtitle: Text(
                            '\$${expense['amount']}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red,
                              fontFamily: "Regular",
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
