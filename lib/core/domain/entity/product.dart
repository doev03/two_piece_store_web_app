class ProductEntity {
  const ProductEntity({
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
}
