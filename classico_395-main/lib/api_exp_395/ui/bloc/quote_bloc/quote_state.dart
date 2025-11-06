import 'package:classico_395/api_exp_395/data/remote/model/quote_model.dart';

abstract class QuoteState{}

  class QuoteInitialState extends QuoteState{}

  class QuoteLoadingState extends QuoteState{}

  class QuoteLoadedState extends QuoteState{
    List<QuoteModel> allQuotes;
    QuoteLoadedState({required this.allQuotes});
  }

  class QuoteErrorState extends QuoteState{
    String errorMsg;
    QuoteErrorState({required this.errorMsg});
  }