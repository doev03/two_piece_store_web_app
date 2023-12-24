// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDTO _$ProductDTOFromJson(Map<String, dynamic> json) => ProductDTO(
      attributes: (json['attributes'] as List<dynamic>)
          .map((e) => ProductAttributeDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      categoryId: json['categoryId'] as String,
      id: json['id'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      joinName: json['joinName'] as String,
      name: json['name'] as String,
      offerId: json['offerId'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductDTOToJson(ProductDTO instance) =>
    <String, dynamic>{
      'attributes': instance.attributes,
      'categoryId': instance.categoryId,
      'id': instance.id,
      'images': instance.images,
      'joinName': instance.joinName,
      'name': instance.name,
      'offerId': instance.offerId,
      'price': instance.price,
    };
