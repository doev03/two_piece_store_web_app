import 'dart:async';

import '../../../core/utils/usecase.dart';
import '../../data/repository/product_detail_repository.dart';
import '../entity/attribute.dart';

class GetAttributesMap extends UseCase<Map<String, AttributeEntity>, GetAttributesMapParams> {
  GetAttributesMap({
    required ProductDetailRepository productRepository,
  }) : _productRepository = productRepository;

  final ProductDetailRepository _productRepository;

  @override
  Future<Map<String, AttributeEntity>> call(GetAttributesMapParams params) async {
    final list = await _productRepository.getAttributes(params.ids);
    final map = {for (final item in list) item.id: item};
    return map;
  }
}

class GetAttributesMapParams {
  const GetAttributesMapParams({required this.ids});

  final List<String> ids;
}
