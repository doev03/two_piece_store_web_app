import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/painting.dart';

import '../../../core/utils/extensions.dart';
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

  Future<Iterable<String>> _getImageUrls(List<String> paths) async {
    final storage = FirebaseStorage.instance.ref();

    return Future.wait(
      paths.map((path) {
        try {
          return storage.child(path).getDownloadURL();
        } on FirebaseException catch (e, s) {
          log('Firebase Exception, $e, $s');
          return null;
        }
      }).whereNotNull(),
    );
  }

  @override
  Future<List<CatalogItemEntity>> getProductsList() async {
    final data = await _remoteDataSource.getProductList();

    return Future.wait(
      data.map((e) async {
        final imageUrls = await _getImageUrls(e.images);
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
}
