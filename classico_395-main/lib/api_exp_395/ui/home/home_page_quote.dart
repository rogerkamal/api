import 'package:classico_395/api_exp_395/data/remote/helper/api_helper.dart';
import 'package:classico_395/api_exp_395/data/remote/model/quote_model.dart';
import 'package:classico_395/api_exp_395/data/remote/model/reciepe_model.dart';
import 'package:classico_395/api_exp_395/domain/constants/urls.dart';
import 'package:classico_395/api_exp_395/ui/bloc/quote_bloc/quote_bloc.dart';
import 'package:classico_395/api_exp_395/ui/bloc/quote_bloc/quote_event.dart';
import 'package:classico_395/api_exp_395/ui/bloc/quote_bloc/quote_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class HomePageQuote extends StatefulWidget {

  @override
  State<HomePageQuote> createState() => _HomePageQuoteState();
}

class _HomePageQuoteState extends State<HomePageQuote> {

  @override
  void initState() {
    super.initState();
    context.read<QuoteBloc>().add(GetAllQuotesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:BlocBuilder<QuoteBloc, QuoteState>(builder: (_, state){
        if(state is QuoteLoadingState){
          return Center(child: CircularProgressIndicator());
        }

        if(state is QuoteErrorState){
          return Center(child: Text(state.errorMsg));
        }

        if(state is QuoteLoadedState){
          return state.allQuotes.isNotEmpty ? ListView.builder(
              itemCount: state.allQuotes.length,
              itemBuilder: (_, index){

                QuoteModel eachQuote  = state.allQuotes[index];

                return Card(
                  child: ListTile(
                    leading: Text(eachQuote.id.toString()),
                    title: Text(eachQuote.quote),
                    subtitle: Text(eachQuote.author),
                  ),
                );
              }): Center(child: Text("No Quotes"));
        }

        return Container();
      })


///    Without Using BLOC

      /*FutureBuilder(
          future: ApiHelper.getApi(url: Urls.quoteUrl),
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if(snapshot.hasError){
              return Center(child: Text("Something went wrong : ${snapshot.error}"),);
            }

            if(snapshot.hasData) {
              if (snapshot != null) {
                QuoteDataModel dataModel = QuoteDataModel.fromJson(
                    snapshot.data);

                return dataModel.quotes.isNotEmpty ? ListView.builder(
                    itemCount: dataModel.quotes.length,
                    itemBuilder: (_, index) {
                      QuoteModel eachQuote = dataModel.quotes[index];

                      return Card(
                        child: ListTile(
                          leading: Text(eachQuote.id.toString()),
                          title: Text(eachQuote.quote),
                          subtitle: Text(eachQuote.author),
                        ),
                      );
                    }) : Center(child: Text("No Qoutes"));
              }
            }
            return Container();
          })*/
    );
  }

}
