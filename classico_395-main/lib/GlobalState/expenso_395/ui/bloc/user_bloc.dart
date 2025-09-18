import 'package:classico_395/GlobalState/expenso_395/data/local/repo/user_repo.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/bloc/user_event.dart';
import 'package:classico_395/GlobalState/expenso_395/ui/bloc/user_state.dart';
// import 'package:expenso_395/data/local/repo/user_repo.dart';
// import 'package:expenso_395/ui/bloc/user_event.dart';
// import 'package:expenso_395/ui/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  UserRepository userRepo;
  UserBloc({required this.userRepo}) : super(UserInitialState()) {

    on<RegisterUserEvent>((event, emit) async{

      emit(UserLoadingState());

      int value = await userRepo.registerUser(user: event.user);

      if(value==1){
        emit(UserSuccessState());
      } else if(value==2){
        emit(UserFailureState(errorMsg: "Email already exists"));
      } else {
        emit(UserFailureState(errorMsg: "Something went wrong"));
      }


    });

    on<LogiUserEvent>((event, emit) async{
      emit(UserLoadingState());

      int value = await userRepo.authenticateUser(email: event.email, pass: event.pass);

      if(value==1){
        emit(UserSuccessState());
      } else if(value==2){
        emit(UserFailureState(errorMsg: "Email is invalid"));
      } else {
        emit(UserFailureState(errorMsg: "Incorrect password"));
      }

    });

  }

}