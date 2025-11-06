
import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier{
  ///data
  List<Map<String,dynamic>> _mData =[];

  ///add
  ///update
  ///delete
  ///get



  ///events
  List<Map<String,dynamic>> getData() => _mData;
  ///add
  void addMap({required Map<String,dynamic> map}){
    _mData.add(map);
    notifyListeners();
  }

  void updateMap({required Map<String,dynamic> updateMap, required int index}){
    _mData[index] = updateMap;
    notifyListeners();
  }



  ///delete
  deleteMap({required int index}){
    /*_mData.remove(_mData[index]); ///removes by value*/
    _mData.removeAt(index); ///removes by specific index
    notifyListeners();
  }
}