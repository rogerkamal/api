import 'dart:core';

class UserModel {
  int id;
  String username;
  String fullName;

  UserModel({required this.id, required this.username, required this.fullName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      fullName: json['fullName'],
    );
  }
}

class CommentModel {
  int id;
  String body;
  int postId;
  int likes;
  UserModel user;

  CommentModel(
      {required this.id,
      required this.body,
      required this.postId,
      required this.likes,
      required this.user});

  factory CommentModel.fromJson(Map<String, dynamic> json) {

    return CommentModel(
        id: json['id'],
        body: json['body'],
        postId: json['postId'],
        likes: json['likes'],
        user: UserModel.fromJson(json['user']));
  }
}

class CommentDataModel {
  List<CommentModel> comments;
  int limit;
  int skip;
  int total;

  CommentDataModel(
      {required this.comments,
      required this.limit,
      required this.skip,
      required this.total});

  factory CommentDataModel.fromJson(Map<String, dynamic> json) {
    List<CommentModel> mComments = [];
    for(Map<String,dynamic> eachComment in json['comments']){
      mComments.add(CommentModel.fromJson(eachComment));
    }

    return CommentDataModel(
        comments: mComments,
        limit: json['limit'],
        skip: json['skip'],
        total: json['total']);
  }
}
