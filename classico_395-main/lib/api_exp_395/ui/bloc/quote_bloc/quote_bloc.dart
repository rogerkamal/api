import 'package:classico_395/api_exp_395/data/remote/helper/api_helper.dart';
import 'package:classico_395/api_exp_395/data/remote/model/quote_model.dart';
import 'package:classico_395/api_exp_395/domain/constants/urls.dart';
import 'package:classico_395/api_exp_395/ui/bloc/quote_bloc/quote_event.dart';
import 'package:classico_395/api_exp_395/ui/bloc/quote_bloc/quote_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState>{
  ApiHelper apiHelper;
  QuoteBloc({required this.apiHelper}) : super(QuoteInitialState()) {
    on<GetAllQuotesEvent>((event, emit) async{
      emit(QuoteLoadingState());

      try{
        dynamic mData = await apiHelper.getApi(url: Urls.quoteUrl);

        QuoteDataModel quoteDataModel = QuoteDataModel.fromJson(mData);

        emit(QuoteLoadedState(allQuotes: quoteDataModel.quotes));
      } catch(e) {

        emit(QuoteErrorState(errorMsg: e.toString()));
      }
    });


  }

}