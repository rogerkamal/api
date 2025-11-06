import 'package:classico_395/TodoApp/db_helperTodo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HomepageTodo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomepageTodoState();
}

class HomepageTodoState extends State<HomepageTodo> {
  DbHelperTodo? dbHelperTodo;
  int isCompletedValue = 0;
  int isAllFlag = 0;
  List<Map<String, dynamic>> allTodolist = [];
  DateFormat df = DateFormat.yMMMEd();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  int priorityVal = 0;
  late Color bgColor;
  MediaQueryData? mqData;

  @override
  void initState() {
    super.initState();

    dbHelperTodo = DbHelperTodo.getInstance();
    getAllTodo();
  }

  void getAllTodo() async {
    allTodolist = await dbHelperTodo!.fetchTodo();
    if (priorityVal == 1 ||
        priorityVal == 2 ||
        priorityVal == 3 ||
        isCompletedValue == 1 ||
        isCompletedValue == 0) {}
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    mqData = MediaQuery.of(context);

    return ScreenUtilInit(
      designSize: Size(mqData!.size.width, mqData!.size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: child,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Column(
          children: [
            SearchBar(
              padding:
                  WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16)),
              leading: Icon(Icons.search),
              onChanged: (value) async {
                Future.delayed(Duration(seconds: 2));
                allTodolist = await dbHelperTodo!.fetchTodo(query: value);
                setState(() {});
              },
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 30,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {
                          isAllFlag = 1;
                          isCompletedValue = -1;
                          priorityVal = -1;
                          allTodolist = await dbHelperTodo!.fetchTodo();
                          setState(() {});
                        },
                        child: isAllFlag == 1
                            ? Container(
                                width: 60,
                                height: 30,
                                color: Colors.grey,
                                child: Center(
                                    child: Text(
                                  "All",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )))
                            : Container(
                                width: 60,
                                height: 30,
                                child: Center(
                                    child: Text(
                                  "All",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () async {
                          isCompletedValue = 1;
                          isAllFlag = -1;
                          priorityVal = -1;
                          allTodolist = await dbHelperTodo!
                              .fetchTodoIsCompleted(
                                  isCompleted: isCompletedValue);
                          setState(() {});
                        },
                        child: isCompletedValue == 1
                            ? Container(
                                width: 70,
                                height: 30,
                                color: Colors.grey,
                                child: Center(
                                    child: Text(
                                  "Completed",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )))
                            : Container(
                                width: 70,
                                height: 30,
                                child: Center(
                                    child: Text(
                                  "Completed",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () async {
                          isCompletedValue = 0;
                          isAllFlag = -1;
                          priorityVal = -1;
                          allTodolist = await dbHelperTodo!
                              .fetchTodoIsCompleted(
                                  isCompleted: isCompletedValue);
                          setState(() {});
                        },
                        child: isCompletedValue == 0
                            ? Container(
                                width: 60,
                                height: 30,
                                color: Colors.grey,
                                child: Center(
                                    child: Text(
                                  "Pending",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )))
                            : Container(
                                width: 60,
                                height: 30,
                                child: Center(
                                    child: Text(
                                  "Pending",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () async {
                          priorityVal = 1;
                          isCompletedValue = -1;
                          isAllFlag = -1;
                          allTodolist = await dbHelperTodo!
                              .fetchTodoPriority(priorityInt: priorityVal);
                          setState(() {});
                        },
                        child: priorityVal == 1
                            ? Container(
                                width: 60,
                                height: 30,
                                color: Colors.blue,
                                child: Center(
                                    child: Text(
                                  "Low",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )))
                            : Container(
                                width: 60,
                                height: 30,
                                child: Center(
                                    child: Text(
                                  "Low",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () async {
                          priorityVal = 3;
                          isCompletedValue = -1;
                          isAllFlag = -1;
                          allTodolist = await dbHelperTodo!
                              .fetchTodoPriority(priorityInt: priorityVal);
                          setState(() {});
                        },
                        child: priorityVal == 3
                            ? Container(
                                width: 60,
                                height: 30,
                                color: Colors.red,
                                child: Center(
                                    child: Text("High",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15))))
                            : Container(
                                width: 60,
                                height: 30,
                                child: Center(
                                    child: Text("High",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15)))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () async {
                          priorityVal = 2;
                          isCompletedValue = -1;
                          isAllFlag = -1;
                          allTodolist = await dbHelperTodo!
                              .fetchTodoPriority(priorityInt: priorityVal);
                          setState(() {});
                        },
                        child: priorityVal == 2
                            ? Container(
                                width: 60,
                                height: 30,
                                color: Colors.yellow,
                                child: Center(
                                    child: Text("Medium",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 15))))
                            : Container(
                                width: 60,
                                height: 30,
                                child: Center(
                                    child: Text("Medium",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15)))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: allTodolist.isNotEmpty
                  ? ListView.builder(
                      itemCount: allTodolist.length,
                      itemBuilder: (_, index) {
                        getBgColor(index);
                        return Card(
                          color: bgColor,
                          child: ListTile(
                            leading: Checkbox(
                              /*value: isCompletedValue == 0,
                        onChanged: (value) {
                          isCompletedValue = value! ? 1 : 0;
                          setState(() {});
                        },*/

                              value: allTodolist[index]
                                      [DbHelperTodo.COLUMN_TODO_IS_COMPLETED] ==
                                  1,
                              onChanged: (value) => _toggleCheckbox(
                                  allTodolist[index]
                                      [DbHelperTodo.COLUMN_TODO_ID],
                                  value),
                              activeColor: Colors.black,
                            ),
                            title: Text(
                              allTodolist[index]
                                  [DbHelperTodo.COLUMN_TODO_TITLE],
                              style: TextStyle(
                                  decoration: allTodolist[index][DbHelperTodo
                                              .COLUMN_TODO_IS_COMPLETED] ==
                                          1
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    allTodolist[index]
                                        [DbHelperTodo.COLUMN_TODO_DESC],
                                    style: TextStyle(
                                        decoration: allTodolist[index][DbHelperTodo
                                                    .COLUMN_TODO_IS_COMPLETED] ==
                                                1
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none)),
                                Text(
                                    df.format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            int.parse(allTodolist[index][
                                                DbHelperTodo
                                                    .COLUMN_TODO_CREATED_AT]))),
                                    style: TextStyle(
                                        decoration: allTodolist[index][DbHelperTodo
                                                    .COLUMN_TODO_IS_COMPLETED] ==
                                                1
                                            ? TextDecoration.lineThrough
                                            : TextDecoration.none)),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () async {
                                      titleController.text = allTodolist[index]
                                          [DbHelperTodo.COLUMN_TODO_TITLE];
                                      descController.text = allTodolist[index]
                                          [DbHelperTodo.COLUMN_TODO_DESC];
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (context) => bottomSheetUI(
                                              isUpdate: true,
                                              id: allTodolist[index]
                                                  [DbHelperTodo.COLUMN_TODO_ID],
                                              priorityVal: allTodolist[index][
                                                  DbHelperTodo
                                                      .COLUMN_TODO_PRIORITY]));
                                    },
                                    icon: Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () async {
                                      bool isDeleted = await dbHelperTodo!
                                          .deleteTodo(
                                              id: allTodolist[index][
                                                  DbHelperTodo.COLUMN_TODO_ID]);
                                      if (isDeleted) {
                                        getAllTodo();
                                      }
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            ),
                          ),
                        );
                      })
                  : Center(child: Text("No data found!")),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            titleController.text = "";
            descController.text = "";
            priorityVal = 0;
            showModalBottomSheet(
                context: context, builder: (_) => bottomSheetUI());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget bottomSheetUI(
      {bool isUpdate = false, int id = 0, int priorityVal = 0}) {
    return StatefulBuilder(builder: (context, ss) {
      return Container(
        padding: EdgeInsets.all(11),
        child: Center(
            child: Column(
          children: [
            Text(
              isUpdate ? "Update Todo" : "Create Todo",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 21,
            ),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                labelText: 'Title',
                hintText: 'Enter Todo Title',
              ),
            ),
            SizedBox(height: 11),
            TextField(
              minLines: 4,
              maxLines: 4,
              controller: descController,
              decoration: InputDecoration(
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                labelText: 'Desc',
                hintText: 'Enter Todo Desc',
              ),
            ),
            SizedBox(height: 11),

            ///PriorityUI
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Priority : ",
                    style: TextStyle(fontSize: 20),
                  ),
                  InkWell(
                    onTap: () {
                      priorityVal = 1;
                      ss(() {});
                    },
                    child: priorityVal == 1
                        ? Container(
                            width: 60,
                            height: 30,
                            color: Colors.blue,
                            child: Center(
                                child: Text(
                              "Low",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )))
                        : Container(
                            width: 60,
                            height: 30,
                            child: Center(
                                child: Text(
                              "Low",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            ))),
                  ),
                  InkWell(
                    onTap: () {
                      priorityVal = 3;
                      ss(() {});
                    },
                    child: priorityVal == 3
                        ? Container(
                            width: 60,
                            height: 30,
                            color: Colors.red,
                            child: Center(
                                child: Text("High",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))))
                        : Container(
                            width: 60,
                            height: 30,
                            child: Center(
                                child: Text("High",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)))),
                  ),
                  InkWell(
                    onTap: () {
                      priorityVal = 2;
                      ss(() {});
                    },
                    child: priorityVal == 2
                        ? Container(
                            width: 60,
                            height: 30,
                            color: Colors.yellow,
                            child: Center(
                                child: Text("Medium",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 15))))
                        : Container(
                            width: 60,
                            height: 30,
                            child: Center(
                                child: Text("Medium",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15)))),
                  ),
                ],
              ),
            ),

            SizedBox(height: 11),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    bool check = false;

                    if (titleController.text.isNotEmpty &&
                        descController.text.isNotEmpty) {
                      if (isUpdate) {
                        check = await dbHelperTodo!.updateTodo(
                          title: titleController.text,
                          desc: descController.text,
                          id: id,
                          priorityInt: priorityVal,
                        );
                      } else {
                        check = await dbHelperTodo!.createTodo(
                          title: titleController.text,
                          desc: descController.text,
                          priorityInt: priorityVal,
                        );
                      }

                      if (check) {
                        getAllTodo();
                        Navigator.pop(context);
                      }
                    } else {}
                  },
                  child: Text('Save'),
                ),
                SizedBox(width: 11),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        )),
      );
    });
  }

  Future<void> _toggleCheckbox(int index, bool? value) async {
    isCompletedValue = value! ? 1 : 0;
    bool isCompletedFlag = await dbHelperTodo!
        .completeTodo(id: index, isCompleted: isCompletedValue);
    if (isCompletedFlag) {
      getAllTodo();
    }

    setState(() {});
  }

  Future<Color> getBgColor(index) async {
    priorityVal = allTodolist[index][DbHelperTodo.COLUMN_TODO_PRIORITY];
    if (priorityVal == 1) {
      bgColor = Colors.blue[300]!;
    } else if (priorityVal == 2) {
      bgColor = Colors.yellow;
    } else if (priorityVal == 3) {
      bgColor = Colors.red[200]!;
    } else {
      bgColor = Colors.white;
    }

    return bgColor;
  }
}
