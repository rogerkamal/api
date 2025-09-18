import 'package:classico_395/GlobalState/expenso_395/data/local/model/cat_model.dart';
// import 'package:expenso_395/data/local/model/cat_model.dart';

class AppConstants {
  static const String appName = 'Expenso';
  static const String version = '1.0.0';

  ///preferences
  static const String prefUserIdKey = 'user_id';

  static List<CategoryModel> mCategories = [
    CategoryModel(id: 1, name: 'Groceries', imgPath: "assets/icons/shopping-bag.png"),
    CategoryModel(id: 2, name: 'Recharge', imgPath: "assets/icons/mobile-transfer.png"),
    CategoryModel(id: 3, name: 'Travel', imgPath: "assets/icons/travel.png"),
    CategoryModel(id: 4, name: 'Shopping', imgPath: "assets/icons/hawaiian-shirt.png"),
    CategoryModel(id: 5, name: 'Petrol', imgPath: "assets/icons/vehicles.png"),
    CategoryModel(id: 6, name: 'Restaurant', imgPath: "assets/icons/restaurant.png"),
    CategoryModel(id: 7, name: 'Snacks', imgPath: "assets/icons/snack.png"),
  ];

}