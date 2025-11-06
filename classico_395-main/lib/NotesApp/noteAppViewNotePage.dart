import 'package:classico_395/NotesApp/NoteAppComposeNotePage.dart';
import 'package:flutter/material.dart';

class NoteAppViewNotePage extends StatelessWidget{
  final dynamic data;
  // List<Map<String,dynamic>> get notesDataList => data;
  const NoteAppViewNotePage({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> notesDataList =data;
   return Scaffold(
     backgroundColor: Colors.black,
     body: Container(
       height: double.infinity,
       margin: EdgeInsets.only(left: 30,right: 30,top: 60),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
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
                 onTap: (){
/*
                   Navigator.push(context, MaterialPageRoute(builder: (_)=>NoteAppComposeNotePage(data : data, isUpdateFlag : true)));
*/
                 },
                 child: Container(
                     padding: EdgeInsets.all(5),
                     height: 45,
                     width: 45,
                     decoration: BoxDecoration(
                         color: Colors.white24,
                         borderRadius: BorderRadius.circular(15)
                     ),
                     child: Icon(Icons.note_alt_outlined,size: 25,color: Colors.white,)),
               )
             ],
           ),
           SizedBox(
             height: 20,
           ),
           Text(data['noteText'],
           style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
           SizedBox(
             height: 20,
           ),
       
           Text(data['dateCreated'],
           style: TextStyle(fontSize: 20,color: Colors.grey),),
           SizedBox(
             height: 20,
           ),
       
           Expanded(
             child: SingleChildScrollView(
               child: Text("he of discrete, often informal diary-style text entries also known as posts. Posts are typically displayed in reverse chronological order so that the most recent post appears first, at the top of the web page. In the 2000s, blogs were often the work of a single individual, occasionally of a small group, and often covered a single subject or topic.\n\nIn the 2010s, multi-author blogs (MABs) emerged, featuring the writing of multiple authors and sometimes professionally edited. MABs from newspapers, other media outlets, universities, think tanks, advocacy groups, and similar institutions account for an increasing quantity of blog traffic.\n\nThis full moon of June is the last of the spring season and the maiden one for summer. Stargazers in the Northern Hemisphere will be able to see the full moon resting low in the southern sky. This means it will appear much larger than normal. In India, the strawberry moon 2025 will reach its fullest on Wednesday, June 11, 2025, at 5:30 AM IST. \n\nHowever, the best time to view it in India will be on the evening of Tuesday, June 10, 2025, just after sunset, between 7:15 PM and 8:00 PM IST. This is when the moon will be rising in the southeastern sky, appearing large, low, and often with a golden-orange hue due to atmospheric filtering.If you are residing in the US, the Strawberry Moon in 2025 will reach its peak illumination on Wednesday, June 11, 2025, at 3:44 AM EDT.",
               style: TextStyle(fontSize: 20,color: Colors.white,),),
             ),
           ),
         ],
       ),
     ),
   );
  }
}