
import 'package:classico_395/api_exp_395/data/remote/helper/api_helper.dart';
import 'package:classico_395/api_exp_395/data/remote/model/reciepe_model.dart';
import 'package:classico_395/api_exp_395/domain/constants/urls.dart';
import 'package:classico_395/api_exp_395/ui/bloc/recipe_bloc/recipe_event.dart';
import 'package:classico_395/api_exp_395/ui/bloc/recipe_bloc/recipe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  ApiHelper apiHelper;

  RecipeBloc({required this.apiHelper}) : super(RecipeInitialState()) {
    on<GetAllRecipesEvent>((event, emit) async {
      emit(RecipeLoadingState());

      try {
        dynamic mData = await apiHelper.getApi(url: Urls.recipeUrl);

        RecipeDataModel recipeDataModel = RecipeDataModel.fromJson(mData);

        emit(RecipeLoadedState(allRecipes: recipeDataModel.recipes));
      } catch (e) {
        emit(RecipeErrorState(errorMsg: e.toString()));
      }
    });
  }
}
