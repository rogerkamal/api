import 'package:classico_395/api_exp_395/data/remote/helper/api_helper.dart';
import 'package:classico_395/api_exp_395/data/remote/model/comment_model.dart';
import 'package:classico_395/api_exp_395/domain/constants/urls.dart';
import 'package:classico_395/api_exp_395/ui/bloc/comment_bloc/comment_event.dart';
import 'package:classico_395/api_exp_395/ui/bloc/comment_bloc/comment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState>{
  ApiHelper apiHelper;
  CommentBloc({required this.apiHelper}) : super(CommentInitialState()){
    on<GetAllCommentsEvent>((event, emit) async {
      emit(CommentLoadingState());

      try{
        dynamic mData = await apiHelper.getApi(url: Urls.commentUrl);

        CommentDataModel commentDataModel = CommentDataModel.fromJson(mData);

        emit(CommentLoadedState(allComment: commentDataModel.comments));
      } catch(e){

        emit(CommentErrorState(errorMsg: e.toString()));
      }


    });
  }
}