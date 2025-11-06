import 'dart:convert';

import 'package:classico_395/api_comments/comment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePageApiComments extends StatefulWidget {

  @override
  State<HomePageApiComments> createState() => _HomePageApiCommentsState();
}

class _HomePageApiCommentsState extends State<HomePageApiComments> {
  List<CommentModel> mComments = [];
  List<UserModel> mUser = [];

  @override
  void initState() {
    super.initState();

    getAllComments();
  }


  getAllComments() async {

    String url = "https://dummyjson.com/comments";
    var response = await http.get(Uri.parse(url));

    print("Res : ${response.body}");
    print("StatusCode : ${response.statusCode}");

    if(response.statusCode ==200){
      dynamic mData = jsonDecode(response.body);
      // mComments = mData["comments"];

      CommentDataModel dataModel = CommentDataModel.fromJson(mData);

      mComments = dataModel.comments;

      setState(() {

      });
    }


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: mComments.isNotEmpty ? ListView.builder(
          itemCount: mComments.length,
          itemBuilder: (_,index){
        return Card(
          child: ListTile(
            title: Text(mComments[index].user.fullName),
            subtitle : Text(mComments[index].body),
            //   title: Text(mComments[index]["user"]["fullName"]),
            //   subtitle : Text(mComments[index]["body"]),
          ),
        );
      }) : Center(child: Text("No data"),)
    );
  }

}
