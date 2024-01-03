// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeDTO _$AttributeDTOFromJson(Map<String, dynamic> json) => AttributeDTO(
      id: json['id'] as String,
      isVariable: json['isVariable'] as bool,
      name: json['name'] as String,
      pickerType: json['pickerType'] as String,
    );

Map<String, dynamic> _$AttributeDTOToJson(AttributeDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isVariable': instance.isVariable,
      'name': instance.name,
      'pickerType': instance.pickerType,
    };
