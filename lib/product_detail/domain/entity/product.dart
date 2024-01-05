import 'package:flutter/painting.dart';

import '../../../core/utils/extensions.dart';
import 'attribute_params.dart';

class ProductEntity {
  ProductEntity({
    required this.attributes,
    required this.categoryId,
    required this.id,
    required this.images,
    required this.joinName,
    required this.name,
    required this.offerId,
    required this.price,
  }) : _attributesMap = attributes.toMap((e) => e.attributeId);

  final List<AttributeParams> attributes;
  final String categoryId;
  final String id;
  final List<ImageProvider> images;
  final String joinName;
  final String name;
  final String offerId;
  final double price;

  final Map<String, AttributeParams> _attributesMap;

  AttributeParams getAttributeById(String id) => _attributesMap[id]!;
}
