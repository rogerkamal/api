
import 'package:classico_395/NotesApp/db_helper.dart';
import 'package:flutter/material.dart';

class NoteAppComposeNotePage extends StatefulWidget {
  // final dynamic data;
  // final bool isUpdateFlag;
  // const NoteAppComposeNotePage({super.key, required this.data, required this.isUpdateFlag, });

  @override
  State<StatefulWidget> createState() => NoteAppComposeNotePageState();
}

class NoteAppComposeNotePageState extends State<NoteAppComposeNotePage>{


  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  DbHelper? dbHelper;


  @override
  void initState() {
    super.initState();

    dbHelper = DbHelper.getInstance();

  }

  @override
  Widget build(BuildContext context) {
    // titleController.clear();
    // descController.clear();
/*    if(widget.isUpdateFlag) {
      titleController.text = widget.data['noteText'];
      descController.text = widget.data[''];
    }else
      {
        titleController.clear();
        descController.clear();
      }*/
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(

        height: double.infinity,
        margin: EdgeInsets.only(left: 20,right: 20,top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: EdgeInsets.all(5),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Icon(Icons.arrow_back_ios_new_outlined,size: 20,color: Colors.white,)),
                ),
                InkWell(
                  onTap: ()async{
                    ///save note in db

                    dbHelper!.addNote(title: titleController.text, desc: descController.text);

                    Navigator.pop(context);
                  },
                  child: Container(
                      padding: EdgeInsets.all(5),
                      height: 45,
                      width: 80,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: Text("Save",style: TextStyle(fontSize: 20,color: Colors.white,)))),
                ),

              ],
            ),

            SizedBox(
              height: 20,
            ),

            TextField(

              controller: titleController,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 50
              ),
              decoration: InputDecoration(
                enabled: true,
                hint: Text("Title",style: TextStyle(
                    color: Colors.grey,
                    fontSize: 50)
                ),
                // fillColor: Colors.grey,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none
              ),
            ),


            Expanded(
              child: SingleChildScrollView(
                child: TextField(
                  controller: descController,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20
                  ),
                  maxLines: 400,
                  decoration: InputDecoration(
                      enabled: true,
                      hint: Text("Type something...",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20)
                      ),
                      // fillColor: Colors.grey,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );

  }


}

