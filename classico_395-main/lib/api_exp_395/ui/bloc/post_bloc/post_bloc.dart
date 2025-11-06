import 'package:classico_395/api_exp_395/data/remote/helper/api_helper.dart';
import 'package:classico_395/api_exp_395/data/remote/model/post_model.dart';
import 'package:classico_395/api_exp_395/domain/constants/urls.dart';
import 'package:classico_395/api_exp_395/ui/bloc/post_bloc/post_event.dart';
import 'package:classico_395/api_exp_395/ui/bloc/post_bloc/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState>{
  ApiHelper apiHelper;
  PostBloc({required this.apiHelper}) : super(PostInitialState()){
    on<GetAllPostEvent>((event, emit){
      emit(PostLoadingState());

      try{
        dynamic mData = apiHelper.getApi(url:Urls.postUrl);

        PostDataModel postDataModel = PostDataModel.fromJson(mData);

        emit(PostLoadedState(allPost: postDataModel.posts!));
      } catch(e){

        emit(PostErrorState(errorMsg: e.toString()));
      }

    });
  }
}