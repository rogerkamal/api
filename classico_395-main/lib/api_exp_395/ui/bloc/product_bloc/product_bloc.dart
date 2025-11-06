import 'package:classico_395/api_exp_395/data/remote/helper/api_helper.dart';
import 'package:classico_395/api_exp_395/data/remote/model/product_model.dart';
import 'package:classico_395/api_exp_395/domain/constants/urls.dart';
import 'package:classico_395/api_exp_395/ui/bloc/product_bloc/product_event.dart';
import 'package:classico_395/api_exp_395/ui/bloc/product_bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>{
  ApiHelper apiHelper;


  ProductBloc({required this.apiHelper}) : super(ProductInitialState()){
    on<GetAllProductsEvent>((event, emit) async {
      emit(ProductLoadingState());


      try{
        dynamic mData = await apiHelper.getApi(url: Urls.productUrl);

        ProductDataModel productDataModel = ProductDataModel.fromJson(mData);

        emit(ProductLoadedState(allProducts: productDataModel.products!));
      } catch(e){
        emit(ProductErrorState(errorMsg: e.toString()));
      }
    });
  }
}