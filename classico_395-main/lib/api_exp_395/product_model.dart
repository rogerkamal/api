class ReviewModel {
  int? rating;
  String? comment;
  String? date;
  // DateTime? date;
  String? reviewerName;
  String? reviewerEmail;

  ReviewModel(
      {required this.rating,
      required this.comment,
      required this.date,
      required this.reviewerName,
      required this.reviewerEmail});

  ///FROMJson
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        rating: json['rating'],
        comment: json['comment'],
        date: json['date'],
        reviewerName: json['reviewerName'],
        reviewerEmail: json['reviewerEmail']);
  }
}

class DimensionModel {
  num? width;
  num? height;
  num? depth;

  DimensionModel(
      {required this.width, required this.height, required this.depth});

  ///fromJson
  factory DimensionModel.fromJson(Map<String, dynamic> json) {
    return DimensionModel(
        width: json['width'], height: json['height'], depth: json['depth']);
  }
}

class MetaModel {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  MetaModel(
      {required this.createdAt,
      required this.updatedAt,
      required this.barcode,
      required this.qrCode});

  ///fromJson
  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        barcode: json['barcode'],
        qrCode: json['qrCode']);
  }
}

class ProductModel {
  int? id;
  String? title;
  String? description;
  String? category;
  num? price;
  num? discountPercentage;
  num? rating;
  num? stock;
  List<dynamic>? tags;
  String? brand;
  String? sku;
  int? weight;
  DimensionModel? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<ReviewModel>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  MetaModel? meta;
  List<dynamic>? images;
  String? thumbnail;


  ProductModel({required this.id, required this.title, required this.description,
  required this.category, required this.price, required this.discountPercentage,
  required this.rating, required this.stock, required this.tags, required this.brand,
  required this.sku, required this.weight, required this.dimensions,
  required this.warrantyInformation, required this.shippingInformation,
  required this.availabilityStatus, required this.reviews, required this.returnPolicy,
  required this.minimumOrderQuantity, required this.meta, required this.images,
  required this.thumbnail});
  
  ///fromJson
  factory ProductModel.fromJson(Map<String, dynamic> json){
    List<ReviewModel> mReviews = [];
    for(Map<String, dynamic> eachReview in json['reviews']){
      mReviews.add(ReviewModel.fromJson(eachReview));
    }


    return ProductModel(id: json['id'], title: json['title'], description: json['description'], category: json['category'], price: json['price'], discountPercentage: json['discountPercentage'], rating: json['rating'], stock: json['stock'], tags: json['tags'], brand: json['brand'], sku: json['sku'], weight: json['weight'], dimensions: json['dimensions'], warrantyInformation: json['warrantyInformation'], shippingInformation: json['shippingInformation'], availabilityStatus: json['availabilityStatus'], reviews: mReviews, returnPolicy: json['returnPolicy'], minimumOrderQuantity: json['minimumOrderQuantity'], meta: json['meta'], images: json['images'], thumbnail: json['thumbnail']);
  }
}

class ProductDataModel {
  List<ProductModel>? products;
  int? total;
  int? skip;
  int? limit;

  ProductDataModel({required this.products,required this.total,required this.skip,required this.limit});

  ///fromJson
  factory ProductDataModel.fromJson(Map<String,dynamic> json){
    List<ProductModel> mProducts = [];
    for(Map<String,dynamic> eachProduct in json['products']){
      mProducts.add(ProductModel.fromJson(eachProduct));
    }
    return ProductDataModel(products: mProducts, total: json['total'], skip: json['skip'], limit: json['limit']);
  }
}
