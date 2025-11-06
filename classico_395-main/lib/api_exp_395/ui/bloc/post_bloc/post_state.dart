import 'package:classico_395/api_exp_395/data/remote/model/post_model.dart';

abstract class PostState{}

class PostInitialState extends PostState{}

class PostLoadingState extends PostState{}

class PostLoadedState extends PostState{
  List<PostModel> allPost;

  PostLoadedState({required this.allPost});
}

class PostErrorState extends PostState{
  String errorMsg;
  PostErrorState({required this.errorMsg});
}



