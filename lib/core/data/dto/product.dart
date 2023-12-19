import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductDTO {
  const ProductDTO({
    required this.id,
    required this.name,
    required this.price,
    required this.images,
    required this.variants,
    required this.sizes,
  });

  final String id;
  final String name;
  final double price;
  final List<String> images;
  final List<String> variants;
  final List<String> sizes;

  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}

@JsonSerializable()
class ProductParameter {
  const ProductParameter({
    required this.type,
    required this.title,
    required this.items,
  });

  final ProductParameterType type;
  final String title;
  final String items;

  factory ProductParameter.fromJson(Map<String, dynamic> json) => _$ProductParameterFromJson(json);
}

@JsonEnum()
enum ProductParameterType {
  string,
  color,
}
