import 'package:flutter/cupertino.dart';

class ReactionsModel {
  int? likes;
  int? dislikes;

  ReactionsModel({required this.likes, required this.dislikes});

  ///fromJson

  factory ReactionsModel.fromJson(Map<String, dynamic> json) {
    return ReactionsModel(likes: json['likes'], dislikes: json['dislikes']);
  }
}

class PostModel {
  int? id;
  String? title;
  String? body;
  List<dynamic>? tags;
  ReactionsModel? reactions;
  int? views;
  int? userId;

  PostModel(
      {required this.id,
      required this.title,
      required this.body,
      required this.tags,
      required this.reactions,
      required this.views,
      required this.userId});

  ///fromJson
  factory PostModel.fromJson(Map<String,dynamic> json){

    return PostModel(id: json['id'], title: json['title'], body: json['body'], tags: json['tags'], reactions: json['reactions'], views: json['views'], userId: json['userId']);
  }


}

class PostDataModel{
List<PostModel>? posts;
int? total;
int? skip;
int? limit;


PostDataModel({required this.posts, required this.total, required this.skip, required this.limit});


///fromJson

factory PostDataModel.fromJson(Map<String,dynamic> json){

  List<PostModel> mPosts = [];

  for(Map<String, dynamic> eachPost in json['posts']){
    mPosts.add(PostModel.fromJson(eachPost));
  }

  return PostDataModel(posts: mPosts, total: json['total'], skip: json['skip'], limit: json['limit']);
}


}