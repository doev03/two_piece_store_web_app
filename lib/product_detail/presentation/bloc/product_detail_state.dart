part of 'product_detail_bloc.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.product,
    this.joinedProducts,
    this.attributesMap,
  });

  final ProductEntity? product;
  final List<ProductEntity>? joinedProducts;
  final Map<String, AttributeEntity>? attributesMap;

  @override
  List<Object?> get props => [product, joinedProducts, attributesMap];

  ProductDetailState copyWith({
    ProductEntity? product,
    List<ProductEntity>? joinedProducts,
    Map<String, AttributeEntity>? attributesMap,
  }) =>
      ProductDetailState(
        product: product ?? this.product,
        joinedProducts: joinedProducts ?? this.joinedProducts,
        attributesMap: attributesMap ?? this.attributesMap,
      );
}
