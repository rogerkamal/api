import 'package:classico_395/GlobalState/bloc_395/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int>{

  CounterBloc() : super(0){

    on<IncrementCountEvent>((event, emit){
      emit(state+event.count);
    });

    on<DecrementCountEvent>((event, emit){
      if(state>0){
        emit(state-1);
      }
    });

  }


}