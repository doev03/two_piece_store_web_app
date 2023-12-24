class CatalogItemEntity {
  const CatalogItemEntity({
    required this.categoryId,
    required this.id,
    required this.images,
    required this.name,
    required this.price,
  });

  final String categoryId;
  final String id;
  final List<String> images;
  final String name;
  final double price;
}
