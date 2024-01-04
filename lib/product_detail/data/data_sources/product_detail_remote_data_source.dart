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
    final productDTO = ProductDTO.fromJson(docJson);

    ((docJson['attributes'] as List<dynamic>)[0] as Map<String, dynamic>)['name'] = 'черный';
    docJson['offerId'] = 'tshirt_zoroanddragon_black_50';
    return productDTO;
  }

  @override
  Future<List<AttributeDTO>> getAttributes(List<String> ids) async {
    final collection = await _db.collection('attributes').get();
    return collection.docs.map((e) => AttributeDTO.fromJson(e.data())).toList();
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
