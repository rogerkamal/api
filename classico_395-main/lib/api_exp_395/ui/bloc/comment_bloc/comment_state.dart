import 'package:classico_395/api_exp_395/data/remote/model/comment_model.dart';

abstract class CommentState{}

class CommentInitialState extends CommentState{}


class CommentLoadingState extends CommentState{}


class CommentLoadedState extends CommentState{
  List<CommentModel> allComment;
  CommentLoadedState({required this.allComment});
}


class CommentErrorState extends CommentState{
  String errorMsg;
  CommentErrorState({required this.errorMsg});
}