
import 'package:classico_395/api_exp_395/ui/dashboard/dashboard_api.dart';
import 'package:classico_395/api_exp_395/ui/home/home_page_product.dart';
import 'package:classico_395/api_exp_395/ui/home/home_page_quote.dart';
import 'package:classico_395/api_exp_395/ui/home/home_page_recipe.dart';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

class AppRoutes{

  static const String dashboard = '/dashboard';
  static const String homeRecipe = '/homeRecipe';
  static const String homeQuote = '/homeQuote';
  static const String homePost = '/homePost';
  static const String homeProduct = '/homeProduct';
  static const String homeCart = '/homeCart';
  static const String homeComment = '/homeComment';
  static const String homeTodo = '/homeTodo';
  static const String homeUser = '/homeUser';



  static Map<String, WidgetBuilder> getRoutes() =>{
    dashboard: (context) => DashboardApi(),
    homeRecipe: (context) => HomePageRecipe(),
    homeQuote: (context) => HomePageQuote(),
    homeProduct: (context) => HomePageProduct(),
  };
}