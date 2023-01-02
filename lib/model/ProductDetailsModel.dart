import 'dart:convert';

class ProductDetailsModel {

  int? id;
  String? articleNo;
  String? seasonYear;
  int? categoryId;
  String? name;
  String? url;
  dynamic? price;
  int? compareAtPrice;
  dynamic? sku;
  dynamic? barcode;
  int? options;
  dynamic? quantity;
  String? tagLine;
  dynamic? description;
  dynamic? timerTime;
  dynamic? timerDate;
  dynamic? timer;
  dynamic? weight;
  dynamic? shipping;
  dynamic? sellOutOfStock;
  dynamic? trackQuantity;
  dynamic? contactUs;
  dynamic? howToGetThere;
  dynamic? safetyStandards;
  dynamic? overview;
  dynamic? highlight;
  dynamic? additionalInformation;
  dynamic? ingredient;
  dynamic? recommended;
  dynamic? benefits;
  int? forwardBooking;
  int? mostViewed;
  int? maxBought;
  int? mostLiked;
  dynamic? metaTitle;
  dynamic? metaKeywords;
  dynamic? metaDescription;
  String? status;
  dynamic? totalQuantity;
  String? image;

  ProductDetailsModel({
    this.id,
    this.articleNo,
    this.seasonYear,
    this.categoryId,
    this.name,
    this.url,
    this.price,
    this.compareAtPrice,
    this.sku,
    this.barcode,
    this.options,
    this.quantity,
    this.tagLine,
    this.description,
    this.timerTime,
    this.timerDate,
    this.timer,
    this.weight,
    this.shipping,
    this.sellOutOfStock,
    this.trackQuantity,
    this.contactUs,
    this.howToGetThere,
    this.safetyStandards,
    this.overview,
    this.highlight,
    this.additionalInformation,
    this.ingredient,
    this.recommended,
    this.benefits,
    this.forwardBooking,
    this.mostViewed,
    this.maxBought,
    this.mostLiked,
    this.metaTitle,
    this.metaKeywords,
    this.metaDescription,
    this.status,
    this.totalQuantity,
    this.image,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
    id: json["id"],
    articleNo: json["article_no"],
    seasonYear: json["season_year"],
    categoryId: json["category_id"],
    name: json["name"],
    url: json["url"],
    price: json["price"].toDouble(),
    compareAtPrice: json["compare_at_price"],
    sku: json["sku"],
    barcode: json["barcode"],
    options: json["options"],
    quantity: json["quantity"],
    tagLine: json["tag_line"],
    description: json["description"],
    timerTime: json["timer_time"],
    timerDate: json["timer_date"],
    timer: json["timer"],
    weight: json["weight"],
    shipping: json["shipping"],
    sellOutOfStock: json["sell_out_of_stock"],
    trackQuantity: json["track_quantity"],
    contactUs: json["contact_us"],
    howToGetThere: json["how_to_get_there"],
    safetyStandards: json["safety_standards"],
    overview: json["overview"],
    highlight: json["highlight"],
    additionalInformation: json["additional_information"],
    ingredient: json["ingredient"],
    recommended: json["recommended"],
    benefits: json["benefits"],
    forwardBooking: json["forward_booking"],
    mostViewed: json["most_viewed"],
    maxBought: json["max_bought"],
    mostLiked: json["most_liked"],
    metaTitle: json["meta_title"],
    metaKeywords: json["meta_keywords"],
    metaDescription: json["meta_description"],
    status: json["status"],
    totalQuantity: json["total_quantity"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "article_no": articleNo,
    "season_year": seasonYear,
    "category_id": categoryId,
    "name": name,
    "url": url,
    "price": price,
    "compare_at_price": compareAtPrice,
    "sku": sku,
    "barcode": barcode,
    "options": options,
    "quantity": quantity,
    "tag_line": tagLine,
    "description": description,
    "timer_time": timerTime,
    "timer_date": timerDate,
    "timer": timer,
    "weight": weight,
    "shipping": shipping,
    "sell_out_of_stock": sellOutOfStock,
    "track_quantity": trackQuantity,
    "contact_us": contactUs,
    "how_to_get_there": howToGetThere,
    "safety_standards": safetyStandards,
    "overview": overview,
    "highlight": highlight,
    "additional_information": additionalInformation,
    "ingredient": ingredient,
    "recommended": recommended,
    "benefits": benefits,
    "forward_booking": forwardBooking,
    "most_viewed": mostViewed,
    "max_bought": maxBought,
    "most_liked": mostLiked,
    "meta_title": metaTitle,
    "meta_keywords": metaKeywords,
    "meta_description": metaDescription,
    "status": status,
    "total_quantity": totalQuantity,
    "image": image,
  };
}

