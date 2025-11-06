import 'package:classico_395/api_exp_395/data/remote/helper/api_helper.dart';
import 'package:classico_395/api_exp_395/data/remote/model/user_model.dart';
import 'package:classico_395/api_exp_395/domain/constants/urls.dart';
import 'package:classico_395/api_exp_395/ui/bloc/user_bloc/user_event.dart';
import 'package:classico_395/api_exp_395/ui/bloc/user_bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  ApiHelper apiHelper;

  UserBloc({required this.apiHelper}) : super(UserInitialState()){

    on<GetAllUsersEvent>((event, emit) async {
      emit(UserLoadingState());

      try{
        dynamic mData = await apiHelper.getApi(url: Urls.userUrl);

        UserDataModel userDataModel = UserDataModel.fromJson(mData);

        emit(UserLoadedState(allUsers:userDataModel.users!));
      } catch(e){

        emit(UserErrorState(errorMsg: e.toString()));
      }


    });
  }


}