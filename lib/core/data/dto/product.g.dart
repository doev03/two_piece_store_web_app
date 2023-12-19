// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDTO _$ProductFromJson(Map<String, dynamic> json) => ProductDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
      variants: (json['variants'] as List<dynamic>).map((e) => e as String).toList(),
      sizes: (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductToJson(ProductDTO instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'images': instance.images,
      'variants': instance.variants,
      'sizes': instance.sizes,
    };

ProductParameter _$ProductParameterFromJson(Map<String, dynamic> json) => ProductParameter(
      type: $enumDecode(_$ProductParameterTypeEnumMap, json['type']),
      title: json['title'] as String,
      items: json['items'] as String,
    );

Map<String, dynamic> _$ProductParameterToJson(ProductParameter instance) => <String, dynamic>{
      'type': _$ProductParameterTypeEnumMap[instance.type]!,
      'title': instance.title,
      'items': instance.items,
    };

const _$ProductParameterTypeEnumMap = {
  ProductParameterType.string: 'string',
  ProductParameterType.color: 'color',
};
