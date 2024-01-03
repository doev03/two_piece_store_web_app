class AttributeEntity {
  const AttributeEntity({
    required this.id,
    required this.isVariable,
    required this.name,
    required this.pickerType,
  });

  final String id;
  final bool isVariable;
  final String name;
  final AttributePickerType pickerType;
}

enum AttributePickerType {
  text('text'),
  image('image'),
  other('[other]');

  const AttributePickerType(this.id);

  final String id;

  static const _idToThis = {
    'text': text,
    'image': image,
  };

  static AttributePickerType fromId(String id) => _idToThis[id] ?? other;
}
