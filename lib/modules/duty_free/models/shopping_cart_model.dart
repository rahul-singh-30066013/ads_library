/*
 * Copyright (c) 2022 .
 * All rights reserved.
 * Adani Digital Labs Confidential Information
 */

import 'package:json_annotation/json_annotation.dart';

part 'shopping_cart_model.g.dart';

///this model class is used to parse json data for shopping cart screen
///*it will call internally .g file to parse all element which we defined here
///

@JsonSerializable()
class ShoppingCartModel {
  List<ShoppingCart> shoppingCart = [];
  ShoppingCart cartPriceDetails;

  ShoppingCartModel({
    required this.shoppingCart,
    required this.cartPriceDetails,
  });

  factory ShoppingCartModel.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingCartModelToJson(this);
}

// main json element listed below
@JsonSerializable()
class ShoppingCart {
  String? _type;
  String? _leftHeader;
  String? _rightHeader;
  String? _leftHeaderSubtitle;
  String? _rightHeaderSubtitle;
  double? _totalCartValue;
  double? _couponDiscount;
  List<ShoppingCartContent>? _content;

  ShoppingCart({
    String? type,
    String? leftHeader,
    String? rightHeader,
    String? leftHeaderSubtitle,
    String? rightHeaderSubtitle,
    double? totalCartValue,
    double? couponDiscount,
    List<ShoppingCartContent>? content,
  }) {
    _type = type;
    _leftHeader = leftHeader;
    _rightHeader = rightHeader;
    _leftHeaderSubtitle = leftHeaderSubtitle;
    _rightHeaderSubtitle = rightHeaderSubtitle;
    _totalCartValue = totalCartValue;
    _couponDiscount = couponDiscount;
    _content = content;
  }

  factory ShoppingCart.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingCartToJson(this);

  String get type => _type ?? '';

  set type(String value) {
    _type = value;
  }

  String get leftHeader => _leftHeader ?? '';

  set leftHeader(String value) {
    _leftHeader = value;
  }

  String get rightHeader => _rightHeader ?? '';

  set rightHeader(String value) {
    _rightHeader = value;
  }

  String get leftHeaderSubtitle => _leftHeaderSubtitle ?? '';

  set leftHeaderSubtitle(String value) {
    _leftHeaderSubtitle = value;
  }

  String get rightHeaderSubtitle => _rightHeaderSubtitle ?? '';

  set rightHeaderSubtitle(String value) {
    _rightHeaderSubtitle = value;
  }

  double get totalCartValue => _totalCartValue ?? 0.0;

  set totalCartValue(double value) {
    _totalCartValue = value;
  }

  double get couponDiscount => _couponDiscount ?? 0.0;

  set couponDiscount(double value) {
    _couponDiscount = value;
  }

  List<ShoppingCartContent> get content => _content ?? [];

  set content(List<ShoppingCartContent> value) {
    _content = value;
  }
}

// elements which we are using inside content object in json listed below
@JsonSerializable()
class ShoppingCartContent {
  String? _icon;
  String? _title;
  String? _subtitle;
  String? _size;
  num? _mrp;
  num? _sprice;
  String? _qty;
  List<Sku>? _sku;
  List<Quantities>? _quantities;
  String? _price;
  String? _priceTypeColor;
  String? _otherLabel;
  String? _otherLabelType;

  String? _vegNonvegIcon;
  String? _productName;
  String? _ratingIcon;
  String? _rating;
  String? _productDescription;
  String? _productImageUrl;
  String? _placeHolderImagePath;
  bool? _showInfoIcon;

  ShoppingCartContent({
    String? icon,
    String? title,
    String? subtitle,
    String? size,
    int? mrp,
    int? sprice,
    String? qty,
    List<Sku>? sku,
    List<Quantities>? quantities,
    String? price,
    String? priceTypeColor,
    String? otherLabel,
    String? otherLabelType,
    String? vegNonvegIcon,
    String? productName,
    String? ratingIcon,
    String? rating,
    String? productDescription,
    String? productImageUrl,
    String? placeHolderImagePath,
    bool? showInfoIcon,
  }) {
    _icon = icon;
    _title = title;
    _subtitle = subtitle;
    _size = size;
    _mrp = mrp;
    _sprice = sprice;
    _qty = qty;
    _sku = sku;
    _quantities = quantities;
    _price = price;
    _priceTypeColor = priceTypeColor;
    _otherLabel = otherLabel;
    _otherLabelType = otherLabelType;
    _vegNonvegIcon = vegNonvegIcon;
    _vegNonvegIcon = vegNonvegIcon;
    _productName = productName;
    _ratingIcon = ratingIcon;
    _rating = rating;
    _productDescription = productDescription;
    _productImageUrl = productImageUrl;
    _placeHolderImagePath = placeHolderImagePath;
    _showInfoIcon = showInfoIcon;
  }

  factory ShoppingCartContent.fromJson(Map<String, dynamic> json) =>
      _$ShoppingCartContentFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingCartContentToJson(this);

  String get icon => _icon ?? '';

  set icon(String value) {
    _icon = value;
  }

  String get title => _title ?? '';

  set title(String value) {
    _title = value;
  }

  String get subtitle => _subtitle ?? '';

  set subtitle(String value) {
    _subtitle = value;
  }

  String get size => _size ?? '';

  set size(String value) {
    _size = value;
  }

  num get mrp => _mrp ?? 0;

  set mrp(num value) {
    _mrp = value;
  }

  num get sprice => _sprice ?? 0;

  set sprice(num value) {
    _sprice = value;
  }

  String get qty => _qty ?? '';

  set qty(String value) {
    _qty = value;
  }

  List<Sku> get sku => _sku ?? [];

  set sku(List<Sku> value) {
    _sku = value;
  }

  List<Quantities> get quantities => _quantities ?? [];

  set quantities(List<Quantities> value) {
    _quantities = value;
  }

  String get price => _price ?? '';

  set price(String value) {
    _price = value;
  }

  String get priceTypeColor => _priceTypeColor ?? '';

  set priceTypeColor(String value) {
    _priceTypeColor = value;
  }

  String get otherLabel => _otherLabel ?? '';

  bool get showInfoIcon => _showInfoIcon ?? false;

  set otherLabel(String value) {
    _otherLabel = value;
  }

  String get otherLabelType => _otherLabelType ?? '';

  set otherLabelType(String value) {
    _otherLabelType = value;
  }

  String get productName => _productName ?? '';

  set productName(String value) {
    _productName = value;
  }

  String get ratingIcon => _ratingIcon ?? '';

  set ratingIcon(String value) {
    _ratingIcon = value;
  }

  String get rating => _rating ?? '';

  set rating(String value) {
    _rating = value;
  }

  String get productDescription => _productDescription ?? '';

  set productDescription(String value) {
    _productDescription = value;
  }

  String get productImageUrl => _productImageUrl ?? '';

  set productImageUrl(String value) {
    _productImageUrl = value;
  }

  String get placeHolderImagePath => _placeHolderImagePath ?? '';

  set placeHolderImagePath(String value) {
    _placeHolderImagePath = value;
  }

  String get vegNonvegIcon => _vegNonvegIcon ?? '';

  set vegNonvegIcon(String value) {
    _vegNonvegIcon = value;
  }
}

@JsonSerializable()
class Sku {
  String? size;

  Sku({this.size});

  factory Sku.fromJson(Map<String, dynamic> json) => _$SkuFromJson(json);
  Map<String, dynamic> toJson() => _$SkuToJson(this);
}

@JsonSerializable()
class Quantities {
  String? size;

  Quantities({this.size});

  factory Quantities.fromJson(Map<String, dynamic> json) =>
      _$QuantitiesFromJson(json);
  Map<String, dynamic> toJson() => _$QuantitiesToJson(this);
}
