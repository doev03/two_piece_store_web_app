import 'package:flutter/painting.dart';

import 'attribute_params.dart';

class ProductEntity {
  const ProductEntity({
    required this.attributes,
    required this.categoryId,
    required this.id,
    required this.images,
    required this.joinName,
    required this.name,
    required this.offerId,
    required this.price,
  });

  final List<AttributeParams> attributes;
  final String categoryId;
  final String id;
  final List<ImageProvider> images;
  final String joinName;
  final String name;
  final String offerId;
  final double price;

  AttributeParams getAttributeById(String id) {
    return attributes.firstWhere((e) => e.attributeId == id);
  }
}
