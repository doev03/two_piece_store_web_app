import 'package:json_annotation/json_annotation.dart';

part 'visible_attribute.g.dart';

@JsonSerializable()
class VisibleAttributeDTO {
  const VisibleAttributeDTO({
    required this.attributeId,
    required this.name,
  });

  factory VisibleAttributeDTO.fromJson(Map<String, dynamic> json) =>
      _$VisibleAttributeDTOFromJson(json);

  final String attributeId;
  final String name;
}
