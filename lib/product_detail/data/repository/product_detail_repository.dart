import 'package:flutter/painting.dart';

import '../../../core/data/data_sources/firebase_storage_data_source.dart';
import '../../domain/entity/attribute.dart';
import '../../domain/entity/attribute_params.dart';
import '../../domain/entity/product.dart';
import '../data_sources/product_detail_remote_data_source.dart';

abstract class ProductDetailRepository {
  Future<ProductEntity> getProduct(String id);

  Future<List<ProductEntity>> getProductsByJoinName(String joinName);

  Future<List<AttributeEntity>> getAttributes(List<String> ids);
}

class ProductDetailRepositoryImpl implements ProductDetailRepository {
  ProductDetailRepositoryImpl({
    required ProductDetailRemoteDataSource remoteDataSource,
    required FirebaseStorageDataSource firebaseStorageDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _firebaseStorageDataSource = firebaseStorageDataSource;

  final ProductDetailRemoteDataSource _remoteDataSource;
  final FirebaseStorageDataSource _firebaseStorageDataSource;

  @override
  Future<ProductEntity> getProduct(String id) async {
    final data = await _remoteDataSource.getProduct(id);
    final imageUrls = await _firebaseStorageDataSource.getImageUrls(data.images);
    return ProductEntity(
      attributes: data.attributes
          .map((e) => AttributeParams(attributeId: e.attributeId, name: e.name))
          .toList(),
      categoryId: data.categoryId,
      id: data.id,
      images: imageUrls.map(NetworkImage.new).toList(),
      joinName: data.joinName,
      name: data.name,
      price: data.price,
      offerId: data.offerId,
    );
  }

  @override
  Future<List<AttributeEntity>> getAttributes(List<String> ids) async {
    final list = await _remoteDataSource.getAttributes(ids);
    return list
        .map(
          (e) => AttributeEntity(
            id: e.id,
            isVariable: e.isVariable,
            name: e.name,
            pickerType: AttributePickerType.fromId(e.pickerType),
          ),
        )
        .toList();
  }

  @override
  Future<List<ProductEntity>> getProductsByJoinName(String joinName) async {
    final list = await _remoteDataSource.getProductsByJoinName(joinName);
    return Future.wait(
      list.map(
        (e) async {
          final imageUrls = await _firebaseStorageDataSource.getImageUrls(e.images);
          return ProductEntity(
            attributes: e.attributes
                .map((e) => AttributeParams(attributeId: e.attributeId, name: e.name))
                .toList(),
            categoryId: e.categoryId,
            id: e.id,
            images: imageUrls.map(NetworkImage.new).toList(),
            joinName: e.joinName,
            name: e.name,
            price: e.price,
            offerId: e.offerId,
          );
        },
      ),
    );
  }
}
