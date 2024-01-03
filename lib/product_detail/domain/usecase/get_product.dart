import 'dart:async';

import '../../../core/utils/usecase.dart';
import '../../data/repository/product_detail_repository.dart';
import '../entity/product.dart';

class GetProduct extends UseCase<ProductEntity, GetProductParams> {
  GetProduct({
    required ProductDetailRepository productRepository,
  }) : _productRepository = productRepository;

  final ProductDetailRepository _productRepository;

  @override
  Future<ProductEntity> call(GetProductParams params) {
    return _productRepository.getProduct(params.id);
  }
}

class GetProductParams {
  const GetProductParams({required this.id});

  final String id;
}
