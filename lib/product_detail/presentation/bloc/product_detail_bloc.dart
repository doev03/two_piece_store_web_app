import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/utils/extensions.dart';
import '../../domain/entity/attribute.dart';
import '../../domain/entity/product.dart';
import '../../domain/usecase/get_attributes_map.dart';
import '../../domain/usecase/get_product.dart';
import '../../domain/usecase/get_products_by_join_name.dart';

part 'product_detail_event.dart';

part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc({
    required GetProduct getProduct,
    required GetAttributesMap getAttributesMap,
    required GetProductsByJoinName getProductsByJoinName,
  })  : _getProduct = getProduct,
        _getAttributesMap = getAttributesMap,
        _getProductsByJoinName = getProductsByJoinName,
        super(const ProductDetailState()) {
    on<ProductDetailPageInit>(_onProductDetailPageInit);
  }

  final GetProduct _getProduct;
  final GetAttributesMap _getAttributesMap;
  final GetProductsByJoinName _getProductsByJoinName;

  Future<void> _onProductDetailPageInit(
    ProductDetailPageInit event,
    Emitter<ProductDetailState> emit,
  ) async {
    final product = await _getProduct.call(GetProductParams(id: event.productId));
    final state = ProductDetailState(product: product);
    emit(state);

    final (attributesMap, joinedProducts) = await futureWait2(
      _getAttributesMap.call(
        GetAttributesMapParams(ids: product.attributes.map((e) => e.attributeId).toList()),
      ),
      _getProductsByJoinName.call(GetProductsByJoinNameParams(joinName: product.joinName)),
    );
    emit(
      ProductDetailState(
        product: product,
        attributesMap: attributesMap,
        joinedProducts: joinedProducts,
      ),
    );
  }
}
