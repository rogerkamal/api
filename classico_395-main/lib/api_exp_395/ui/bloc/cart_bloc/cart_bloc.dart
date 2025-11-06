import 'package:classico_395/api_exp_395/data/remote/helper/api_helper.dart';
import 'package:classico_395/api_exp_395/data/remote/model/cart_model.dart';
import 'package:classico_395/api_exp_395/domain/constants/urls.dart';
import 'package:classico_395/api_exp_395/ui/bloc/cart_bloc/cart_event.dart';
import 'package:classico_395/api_exp_395/ui/bloc/cart_bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent, CartState>{
  ApiHelper apiHelper;

  CartBloc({required this.apiHelper}) : super(CartInitialState()){

    on<GetAllCartsEvent>((event, emit) async {
      emit(CartLoadingState());

      try{
      dynamic mData = await apiHelper.getApi(url: Urls.cartUrl);

      CartDataModel cartDataModel = CartDataModel.fromJson(mData);

      emit(CartLoadedState(allCarts: cartDataModel.carts!));

      } catch(e){

        emit(CartErrorState(errorMsg: e.toString()));
      }

    });

  }
}