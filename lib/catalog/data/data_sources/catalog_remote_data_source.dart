import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/data/dto/product.dart';

// ignore: one_member_abstracts
abstract class CatalogRemoteDataSource {
  Future<List<ProductDTO>> getProducts();
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  CatalogRemoteDataSourceImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _db = firebaseFirestore;

  final FirebaseFirestore _db;

  @override
  Future<List<ProductDTO>> getProducts() async {
    final products = await _db.collection('products').get();
    return products.docs.map((doc) {
      final json = doc.data();
      json['id'] = doc.id;
      return ProductDTO.fromJson(json);
    }).toList();
  }
}
