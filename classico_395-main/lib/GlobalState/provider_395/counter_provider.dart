import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier{

  ///data
  int _count = 0;

  int getCountValue() => _count;

  void incrementCount(){
    _count++;
    notifyListeners();
  }
  void decrementCount(){
    if(_count>0){
      _count--;
      notifyListeners();
    }
  }

}