// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shopping_cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingCartModel _$ShoppingCartModelFromJson(Map<String, dynamic> json) =>
    ShoppingCartModel(
      shoppingCart: (json['shoppingCart'] as List<dynamic>)
          .map((e) => ShoppingCart.fromJson(e as Map<String, dynamic>))
          .toList(),
      cartPriceDetails: ShoppingCart.fromJson(
          json['cartPriceDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShoppingCartModelToJson(ShoppingCartModel instance) =>
    <String, dynamic>{
      'shoppingCart': instance.shoppingCart,
      'cartPriceDetails': instance.cartPriceDetails,
    };

ShoppingCart _$ShoppingCartFromJson(Map<String, dynamic> json) => ShoppingCart(
      type: json['type'] as String?,
      leftHeader: json['leftHeader'] as String?,
      rightHeader: json['rightHeader'] as String?,
      leftHeaderSubtitle: json['leftHeaderSubtitle'] as String?,
      rightHeaderSubtitle: json['rightHeaderSubtitle'] as String?,
      totalCartValue: (json['totalCartValue'] as num?)?.toDouble(),
      couponDiscount: (json['couponDiscount'] as num?)?.toDouble(),
      content: (json['content'] as List<dynamic>?)
          ?.map((e) => ShoppingCartContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShoppingCartToJson(ShoppingCart instance) =>
    <String, dynamic>{
      'type': instance.type,
      'leftHeader': instance.leftHeader,
      'rightHeader': instance.rightHeader,
      'leftHeaderSubtitle': instance.leftHeaderSubtitle,
      'rightHeaderSubtitle': instance.rightHeaderSubtitle,
      'totalCartValue': instance.totalCartValue,
      'couponDiscount': instance.couponDiscount,
      'content': instance.content,
    };

ShoppingCartContent _$ShoppingCartContentFromJson(Map<String, dynamic> json) =>
    ShoppingCartContent(
      icon: json['icon'] as String?,
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      size: json['size'] as String?,
      mrp: json['mrp'] as int?,
      sprice: json['sprice'] as int?,
      qty: json['qty'] as String?,
      sku: (json['sku'] as List<dynamic>?)
          ?.map((e) => Sku.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantities: (json['quantities'] as List<dynamic>?)
          ?.map((e) => Quantities.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: json['price'] as String?,
      priceTypeColor: json['priceTypeColor'] as String?,
      otherLabel: json['otherLabel'] as String?,
      otherLabelType: json['otherLabelType'] as String?,
      vegNonvegIcon: json['vegNonvegIcon'] as String?,
      productName: json['productName'] as String?,
      ratingIcon: json['ratingIcon'] as String?,
      rating: json['rating'] as String?,
      productDescription: json['productDescription'] as String?,
      productImageUrl: json['productImageUrl'] as String?,
      placeHolderImagePath: json['placeHolderImagePath'] as String?,
      showInfoIcon: json['showInfoIcon'] as bool?,
    );

Map<String, dynamic> _$ShoppingCartContentToJson(
        ShoppingCartContent instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'size': instance.size,
      'mrp': instance.mrp,
      'sprice': instance.sprice,
      'qty': instance.qty,
      'sku': instance.sku,
      'quantities': instance.quantities,
      'price': instance.price,
      'priceTypeColor': instance.priceTypeColor,
      'otherLabel': instance.otherLabel,
      'showInfoIcon': instance.showInfoIcon,
      'otherLabelType': instance.otherLabelType,
      'productName': instance.productName,
      'ratingIcon': instance.ratingIcon,
      'rating': instance.rating,
      'productDescription': instance.productDescription,
      'productImageUrl': instance.productImageUrl,
      'placeHolderImagePath': instance.placeHolderImagePath,
      'vegNonvegIcon': instance.vegNonvegIcon,
    };

Sku _$SkuFromJson(Map<String, dynamic> json) => Sku(
      size: json['size'] as String?,
    );

Map<String, dynamic> _$SkuToJson(Sku instance) => <String, dynamic>{
      'size': instance.size,
    };

Quantities _$QuantitiesFromJson(Map<String, dynamic> json) => Quantities(
      size: json['size'] as String?,
    );

Map<String, dynamic> _$QuantitiesToJson(Quantities instance) =>
    <String, dynamic>{
      'size': instance.size,
    };
