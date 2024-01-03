import 'package:flutter/painting.dart';
import 'package:json_annotation/json_annotation.dart';

import 'visible_attribute.dart';

part 'product.g.dart';

@JsonSerializable()
class ProductDTO {
  const ProductDTO({
    required this.attributes,
    required this.categoryId,
    required this.id,
    required this.images,
    required this.joinName,
    required this.name,
    required this.offerId,
    required this.price,
  });

  factory ProductDTO.fromJson(Map<String, dynamic> json) => _$ProductDTOFromJson(json);

  final List<VisibleAttributeDTO> attributes;
  final String categoryId;
  final String id;
  final List<String> images;
  final String joinName;
  final String name;
  final String offerId;
  final double price;
}
