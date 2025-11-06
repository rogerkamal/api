import 'package:classico_395/NotesApp/NoteAppComposeNotePage.dart';
import 'package:classico_395/NotesApp/noteAppViewNotePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class NoteAppHomePage extends StatelessWidget {
  MediaQueryData? mqData;
  List<Map<String, dynamic>> notesDataList = [
    {
      "backgroundColor": Colors.red[200],
      "noteText": "How to make your personal brand stand out online",
      "dateCreated": "May 21,2020"
    },
    {
      "backgroundColor": Colors.orange[200],
      "noteText": "Beautiful weather app UI concepts we wish existed",
      "dateCreated": "Mar 18,2020"
    },
    {
      "backgroundColor": Colors.lime[200],
      "noteText": "10 excellent font pairing tools for designers",
      "dateCreated": "Feb 01,2020"
    },
    {
      "backgroundColor": Colors.lightBlueAccent[200],
      "noteText": "Spotify Reema Bhagat on product design, music and the key to a happy career",
      "dateCreated": "Feb 01,2020"
    },
    {
      "backgroundColor": Colors.deepPurple[300],
      "noteText": "12 eye - catching mobile wallpaper",
      "dateCreated": "Feb 01,2020"
    },
    {
      "backgroundColor": Colors.tealAccent[200],
      "noteText": "12 eye - catching mobile wallpaper",
      "dateCreated": "Feb 01,2020"
    },
    {
      "backgroundColor": Colors.pinkAccent[200],
      "noteText": "Design For Good: Join The Face Mask Challenge",
      "dateCreated": "Feb 01,2020"
    },
    {
      "backgroundColor": Colors.deepPurple[300],
      "noteText": "12 eye - catching mobile wallpaper",
      "dateCreated": "Feb 01,2020"
    },
    {
      "backgroundColor": Colors.lime[200],
      "noteText": "10 excellent font pairing tools for designers",
      "dateCreated": "Feb 01,2020"
    },
    {
      "backgroundColor": Colors.orange[200],
      "noteText": "Beautiful weather app UI concepts we wish existed",
      "dateCreated": "Mar 18,2020"
    },
    {
      "backgroundColor": Colors.pinkAccent[200],
      "noteText": "Design For Good: Join The Face Mask Challenge",
      "dateCreated": "Feb 01,2020"
    },
    {
      "backgroundColor": Colors.lightBlueAccent[200],
      "noteText":
          "Spotify Reema Bhagat on product design, music and the key to a happy career",
      "dateCreated": "Feb 01,2020"
    },
  ];
  List<Map<String, dynamic>> allNotes = [];
  DateFormat df = DateFormat.yMMMEd();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();



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
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          margin: EdgeInsets.only(left: 20, right: 20, top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notes",
                      style: TextStyle(fontSize: 50, color: Colors.white)),
                  Container(
                      padding: EdgeInsets.only(left: 2),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15)),
                      child: Icon(
                        Icons.search_outlined,
                        size: 35,
                        color: Colors.white,
                      ))
                ],
              ),
              Expanded(
                child: Container(
                  // margin: EdgeInsets.only(top: 10),
                  height: double.infinity,
                  width: double.infinity,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisSpacing: 11,
                          crossAxisSpacing: 11,
                          childAspectRatio: 1),
                      itemCount: allNotes.length,
                      itemBuilder: (_, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => NoteAppViewNotePage(
                                        data: allNotes[index])));
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            width: 500,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: notesDataList[index]['backgroundColor']),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
/*
                              Text(
                                allNotes[index][COLUMN_TITLE],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              ),
*/
                                Text(
                                  notesDataList[index]['dateCreated'],
                                  style: TextStyle(
                                    color: Colors.grey[700],
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 30, right: 10),
          child: FloatingActionButton(
            onPressed: () {
              // showAlertDialog('Add a new Note');
              Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteAppComposeNotePage()));
            },
            backgroundColor: Colors.black,
            shape: CircleBorder(),
            elevation: 10,
            child: Icon(Icons.add, color: Colors.white, size: 32),
          ),
        ),
      )
    );

  }

  void showAlertDialog(String msg) {
    Fluttertoast.showToast(
      msg: "$msg",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_RIGHT, // or TOP, CENTER
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 20,
    );
  }
}
