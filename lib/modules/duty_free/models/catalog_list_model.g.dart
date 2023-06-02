// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogListModel _$CatalogListModelFromJson(Map<String, dynamic> json) =>
    CatalogListModel(
      categoryId: json['category_id'] as int,
      productList: (json['product_list'] as List<dynamic>?)
          ?.map((e) => ProductList.fromJson(e as Map<String, dynamic>))
          .toList(),
      productAddress: json['product_address'] == null
          ? null
          : ProductAddress.fromJson(
              json['product_address'] as Map<String, dynamic>),
      stories: (json['stories'] as List<dynamic>?)
          ?.map((e) => Stories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CatalogListModelToJson(CatalogListModel instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'product_list': instance.productList,
      'product_address': instance.productAddress,
      'stories': instance.stories,
    };

ProductList _$ProductListFromJson(Map<String, dynamic> json) => ProductList(
      productId: json['product_id'] as int,
      image: json['image'] as String?,
      name: json['name'] as String?,
      size: json['size'] as String?,
      price: json['price'] as num?,
      discount: json['discount'] as num?,
      type: json['type'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      qty: json['qty'] as int?,
      quantities: (json['quantities'] as List<dynamic>?)
          ?.map((e) => Quantities.fromJson(e as Map<String, dynamic>))
          .toList(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$ProductListToJson(ProductList instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'image': instance.image,
      'name': instance.name,
      'size': instance.size,
      'price': instance.price,
      'discount': instance.discount,
      'type': instance.type,
      'is_favorite': instance.isFavorite,
      'qty': instance.qty,
      'unit': instance.unit,
      'quantities': instance.quantities,
    };

ProductAddress _$ProductAddressFromJson(Map<String, dynamic> json) =>
    ProductAddress(
      itemName: json['item_name'] as String?,
      itemType: json['item_type'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ProductAddressToJson(ProductAddress instance) =>
    <String, dynamic>{
      'item_name': instance.itemName,
      'item_type': instance.itemType,
      'address': instance.address,
    };

Stories _$StoriesFromJson(Map<String, dynamic> json) => Stories(
      storyId: json['story_id'] as int,
      url: json['url'] as String?,
      type: json['type'] as String?,
      duration: json['duration'] as int?,
    );

Map<String, dynamic> _$StoriesToJson(Stories instance) => <String, dynamic>{
      'story_id': instance.storyId,
      'url': instance.url,
      'type': instance.type,
      'duration': instance.duration,
    };

Quantities _$QuantitiesFromJson(Map<String, dynamic> json) => Quantities(
      size: json['size'] as String?,
    );

Map<String, dynamic> _$QuantitiesToJson(Quantities instance) =>
    <String, dynamic>{
      'size': instance.size,
    };
