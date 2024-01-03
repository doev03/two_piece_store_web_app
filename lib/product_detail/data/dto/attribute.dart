import 'package:json_annotation/json_annotation.dart';

part 'attribute.g.dart';

@JsonSerializable()
class AttributeDTO {
  const AttributeDTO({
    required this.id,
    required this.isVariable,
    required this.name,
    required this.pickerType,
  });

  factory AttributeDTO.fromJson(Map<String, dynamic> json) => _$AttributeDTOFromJson(json);

  final String id;
  final bool isVariable;
  final String name;
  final String pickerType;
}
