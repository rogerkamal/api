import 'dart:convert';

import 'package:classico_395/api_exp_395/data/remote/helper/api_helper.dart';
import 'package:classico_395/api_exp_395/data/remote/model/quote_model.dart';
import 'package:classico_395/api_exp_395/data/remote/model/reciepe_model.dart';
import 'package:classico_395/api_exp_395/domain/constants/urls.dart';
import 'package:classico_395/api_exp_395/ui/bloc/recipe_bloc/recipe_bloc.dart';
import 'package:classico_395/api_exp_395/ui/bloc/recipe_bloc/recipe_event.dart';
import 'package:classico_395/api_exp_395/ui/bloc/recipe_bloc/recipe_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class HomePageRecipe extends StatefulWidget {

  @override
  State<HomePageRecipe> createState() => _HomePageRecipeState();
}

class _HomePageRecipeState extends State<HomePageRecipe> {

  // List<dynamic> mQuotes = [];
  List<QuoteModel> mQuotes = [];


  @override
  void initState() {
    super.initState();
    context.read<RecipeBloc>().add(GetAllRecipesEvent());
    // getAllQuotes();
  }

/*
  void getAllQuotes() async{

    String url = "https://dummyjson.com/quotes";

    var response = await http.get(Uri.parse(url));

    print("Res: ${response.body}");

    dynamic mData = jsonDecode(response.body);
    // mQuotes = mData["quotes"];

    QuoteDataModel dataModel = QuoteDataModel.fromJson(mData);

    mQuotes = dataModel.quotes;
    setState(() {

    });
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body:BlocBuilder<RecipeBloc, RecipeState>(builder: (_, state){
        if(state is RecipeLoadingState){
          return Center(child: CircularProgressIndicator());
        }

        if(state is RecipeErrorState){
          return Center(child: Text(state.errorMsg));
        }

        if(state is RecipeLoadedState){
          return state.allRecipes.isNotEmpty ? ListView.builder(
              itemCount: state.allRecipes.length,
              itemBuilder: (_, index) {

                RecipeModel eachRecipe = state.allRecipes[index];

                return Card(
                  child: ListTile(
                    leading: Image.network(eachRecipe.image),
                    title: Text(eachRecipe.name),
                    subtitle: Text(eachRecipe.cuisine),
                  ),
                );
              }) : Center(
            child: Text('No Quotes'),
          );
        }

        return Container();
      })

      /*FutureBuilder(
            future: ApiHelper.getApi(url: Urls.recipeUrl),
            builder: (_, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text("Something went wrong : ${snapshot.error}"),
                );
              }
              if (snapshot.hasData) {

                if (snapshot != null) {
                  RecipeDataModel dataModel = RecipeDataModel.fromJson(
                      snapshot.data);

                  return dataModel.recipes.isNotEmpty ? ListView.builder(
                      itemCount: dataModel.recipes.length,
                      itemBuilder: (_, index) {

                        RecipeModel eachRecipe = dataModel.recipes[index];

                        return Card(
                          child: ListTile(
                            leading: Image.network(eachRecipe.image),
                            title: Text(eachRecipe.name),
                            subtitle: Text(eachRecipe.cuisine),
                          ),
                        );
                      }) : Center(
                    child: Text('No Quotes'),
                  );
                } else {
                  return Center(
                    child: Text("No Data"),
                  );
                }

*/
                /*if (snapshot != null) {
                  QuoteDataModel dataModel = QuoteDataModel.fromJson(
                      snapshot.data);

                  return dataModel.quotes.isNotEmpty ? ListView.builder(
                    itemCount: dataModel.quotes.length,
                      itemBuilder: (_, index) {

                      QuoteModel eachQuote = dataModel.quotes[index];

                      return Card(
                        child: ListTile(
                          title: Text(eachQuote.quote),
                          subtitle: Text(eachQuote.author),
                        ),
                      );
                      }) : Center(
                    child: Text('No Quotes'),
                  );
                } else {
                  return Center(
                    child: Text("No Data"),
                  );
                }*//*
              }
              return Container();
            })*/
      /*mQuotes.isNotEmpty ? ListView.builder(
          itemCount: mQuotes.length,
          itemBuilder: (_, index){
        return Card(
          child: ListTile(
            // title: Text(mQuotes[index]["quote"]),
            // subtitle: Text(mQuotes[index]["author"]),
            title: Text(mQuotes[index].quote),
            subtitle: Text(mQuotes[index].author),
          ),
        );
      }) : Center(
        child: Text('No Quotes'),
      ),*/
    );
  }
}