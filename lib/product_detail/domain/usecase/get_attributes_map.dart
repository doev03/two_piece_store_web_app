import 'dart:async';

import '../../../core/utils/extensions.dart';
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
    return list.toMap((e) => e.id);
  }
}

class GetAttributesMapParams {
  const GetAttributesMapParams({required this.ids});

  final List<String> ids;
}
