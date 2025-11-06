import 'package:classico_395/api_exp_395/data/remote/model/cart_model.dart';

abstract class CartState{}

class CartInitialState extends CartState{}

class CartLoadingState extends CartState{}


class CartLoadedState extends CartState{
  List<CartModel> allCarts;

  CartLoadedState({required this.allCarts});
}


class CartErrorState extends CartState{
  String errorMsg;
  CartErrorState({required this.errorMsg});
}