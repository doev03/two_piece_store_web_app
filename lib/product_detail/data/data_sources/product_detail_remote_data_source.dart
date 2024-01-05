import 'package:cloud_firestore/cloud_firestore.dart';

import '../dto/attribute.dart';
import '../dto/product.dart';

abstract class ProductDetailRemoteDataSource {
  Future<ProductDTO> getProduct(String id);

  Future<List<ProductDTO>> getProductsByJoinName(String joinName);

  Future<List<AttributeDTO>> getAttributes(List<String> ids);
}

class ProductDetailRemoteDataSourceImpl implements ProductDetailRemoteDataSource {
  ProductDetailRemoteDataSourceImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _db = firebaseFirestore;

  final FirebaseFirestore _db;

  @override
  Future<ProductDTO> getProduct(String id) async {
    final doc = await _db.doc('products/$id').get();
    final docJson = doc.data();
    if (docJson == null) {
      throw Exception('Товара не существует');
    }
    return ProductDTO.fromJson(docJson);
  }

  @override
  Future<List<AttributeDTO>> getAttributes(List<String> ids) async {
    final collection = await _db.collection('attributes').get();
    return collection.docs.map((e) {
      final json = e.data();
      json['id'] = e.id;
      return AttributeDTO.fromJson(json);
    }).toList();
  }

  @override
  Future<List<ProductDTO>> getProductsByJoinName(String joinName) async {
    final collection = await _db
        .collection('products')
        .where(
          'joinName',
          isEqualTo: joinName,
        )
        .get();
    return collection.docs.map((e) => ProductDTO.fromJson(e.data())).toList();
  }
}
