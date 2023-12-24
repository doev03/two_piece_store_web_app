import 'package:json_annotation/json_annotation.dart';

part 'product_attribute.g.dart';

@JsonSerializable()
class ProductAttributeDTO {
  const ProductAttributeDTO({
    required this.attributeId,
    required this.name,
  });

  factory ProductAttributeDTO.fromJson(Map<String, dynamic> json) =>
      _$ProductAttributeDTOFromJson(json);

  final String attributeId;
  final String name;
}
