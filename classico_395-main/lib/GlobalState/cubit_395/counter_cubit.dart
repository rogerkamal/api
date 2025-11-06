import 'package:classico_395/GlobalState/cubit_395/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit() : super(CounterState(count: 0));

  ///events
  incrementCount(){
    emit(CounterState(count: state.count+1));
  }

  decrementCount(){
    if(state.count > 0) {
      emit(CounterState(count: state.count-1));
    }
  }
}