class ProductsModel {
  int? id;
  String? title;
  num? price;
  int? quantity;
  num? total;
  num? discountPercentage;
  num? discountedTotal;
  String? thumbnail;

  ProductsModel(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity,
      required this.total,
      required this.discountPercentage,
      required this.discountedTotal,
      required this.thumbnail});

  ///fromJson

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        quantity: json['quantity'],
        total: json['total'],
        discountPercentage: json['discountPercentage'],
        discountedTotal: json['discountedTotal'],
        thumbnail: json['thumbnail']);
  }
}

class CartModel {
  int? id;
  List<ProductsModel>? products;
  num? total;
  num? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  CartModel(
      {required this.id,
      required this.products,
      required this.total,
      required this.discountedTotal,
      required this.userId,
      required this.totalProducts,
      required this.totalQuantity});

  ///fromJson

  factory CartModel.fromJson(Map<String, dynamic> json) {
    List<ProductsModel> mProducts = [];

    for (Map<String, dynamic> eachProduct in json["products"]) {
      mProducts.add(ProductsModel.fromJson(eachProduct));
    }
    return CartModel(
        id: json['id'],
        products: mProducts,
        total: json['total'],
        discountedTotal: json['discountedTotal'],
        userId: json['userId'],
        totalProducts: json['totalProducts'],
        totalQuantity: json['totalQuantity']);
  }
}

class CartDataModel {
  List<CartModel>? carts;
  int? total;
  int? skip;
  int? limit;

  CartDataModel(
      {required this.carts,
      required this.total,
      required this.skip,
      required this.limit});

  ///fromJson
  factory CartDataModel.fromJson(Map<String, dynamic> json) {
    List<CartModel> mCarts = [];

    for (Map<String, dynamic> eachCart in json['carts']) {
      mCarts.add(CartModel.fromJson(eachCart));
    }

    return CartDataModel(
        carts: mCarts,
        total: json['total'],
        skip: json['skip'],
        limit: json['limit']);
  }
}
