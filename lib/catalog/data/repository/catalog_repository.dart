import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/painting.dart';

import '../../domain/entity/catalog_item.dart';
import '../data_sources/catalog_remote_data_source.dart';

// ignore: one_member_abstracts
abstract class CatalogRepository {
  Future<List<CatalogItemEntity>> getProductsList();
}

class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl({
    required CatalogRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final CatalogRemoteDataSource _remoteDataSource;

  @override
  Future<List<CatalogItemEntity>> getProductsList() async {
    final data = await _remoteDataSource.getProductList();

    final storage = FirebaseStorage.instance.ref();
    final imageRef = storage.child('media/zoroanddragon_black_50.jpg');
    final imageUrl = await imageRef.getDownloadURL();

    return data
        .map(
          (e) => CatalogItemEntity(
            categoryId: e.categoryId,
            id: e.id,
            images: e.images.map((path) => NetworkImage(imageUrl)).toList(),
            name: e.name,
            price: e.price,
          ),
        )
        .toList();
  }
}
