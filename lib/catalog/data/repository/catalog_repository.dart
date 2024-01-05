import 'package:flutter/painting.dart';

import '../../../core/data/data_sources/firebase_storage_data_source.dart';
import '../../../core/data/dto/product.dart';
import '../../domain/entity/catalog_item.dart';
import '../data_sources/catalog_remote_data_source.dart';

// ignore: one_member_abstracts
abstract class CatalogRepository {
  Future<List<CatalogItemEntity>> getCatalogItems();
}

class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl({
    required CatalogRemoteDataSource remoteDataSource,
    required FirebaseStorageDataSource firebaseStorageDataSource,
  })  : _remoteDataSource = remoteDataSource,
        _firebaseStorageDataSource = firebaseStorageDataSource;

  final CatalogRemoteDataSource _remoteDataSource;
  final FirebaseStorageDataSource _firebaseStorageDataSource;

  @override
  Future<List<CatalogItemEntity>> getCatalogItems() async {
    final allProducts = await _remoteDataSource.getProducts();

    final resultProducts = _getProductsWithUniqueImages(allProducts);

    return Future.wait(
      resultProducts.map((e) async {
        final imageUrls = await _firebaseStorageDataSource.getDownloadUrls(e.images);
        return CatalogItemEntity(
          categoryId: e.categoryId,
          id: e.id,
          images: imageUrls.map(NetworkImage.new).toList(),
          name: e.name,
          price: e.price,
        );
      }),
    );
  }

  List<ProductDTO> _getProductsWithUniqueImages(List<ProductDTO> list) {
    final result = <ProductDTO>[];
    final imageSet = <String>{};
    for (final item in list) {
      final imagesString = item.images.toString();
      if (imageSet.contains(imagesString)) {
        continue;
      } else {
        result.add(item);
        imageSet.add(imagesString);
      }
    }
    return result;
  }
}
