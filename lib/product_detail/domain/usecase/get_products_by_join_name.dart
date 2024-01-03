import 'dart:async';

import '../../../core/utils/usecase.dart';
import '../../data/repository/product_detail_repository.dart';
import '../entity/product.dart';

class GetProductsByJoinName extends UseCase<List<ProductEntity>, GetProductsByJoinNameParams> {
  GetProductsByJoinName({
    required ProductDetailRepository productRepository,
  }) : _productRepository = productRepository;

  final ProductDetailRepository _productRepository;

  @override
  Future<List<ProductEntity>> call(GetProductsByJoinNameParams params) {
    return _productRepository.getProductsByJoinName(params.joinName);
  }
}

class GetProductsByJoinNameParams {
  const GetProductsByJoinNameParams({required this.joinName});

  final String joinName;
}
