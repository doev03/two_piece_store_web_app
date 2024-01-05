part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent {}

class ProductDetailPageInit extends ProductDetailEvent {
  ProductDetailPageInit({required this.productId});

  final String productId;
}
