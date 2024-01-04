import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/data/dto/product.dart';

// ignore: one_member_abstracts
abstract class CatalogRemoteDataSource {
  Future<List<ProductDTO>> getProductList();
}

class CatalogRemoteDataSourceImpl implements CatalogRemoteDataSource {
  CatalogRemoteDataSourceImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _db = firebaseFirestore;

  final FirebaseFirestore _db;

  @override
  Future<List<ProductDTO>> getProductList() async {
    final collection = await _db.collection('products').get();
    return collection.docs
        .map((doc) => ProductDTO.fromJson(doc.data()))
        .toList();
  }
}

class CatalogRemoteDataSourceTest implements CatalogRemoteDataSource {
  @override
  Future<List<ProductDTO>> getProductList() async {
    return const [
/*      ProductDTO(
        id: 'id_0',
        name: 'Футболка 0',
        price: 1500,
        images: ['https://storage.vsemayki.ru/images/0/3/3297/3297733/previews/people_4_manshort_back_black_500.jpg'],
        variants: [],
        sizes: [],
      ),
      ProductDTO(
        id: 'id_1',
        name: 'Футболка 1',
        price: 1500,
        images: ['https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA2L3JtMzYzLWIwOC1tb2NrdXAuanBn.jpg'],
        variants: [],
        sizes: [],
      ),
      ProductDTO(
        id: 'id_2',
        name: 'Футболка 2',
        price: 1500,
        images: ['https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsX29mZmljZV8yNV9waG90b19vZl93aGl0ZV9tYWxlX3RzaGlydF9tb2NrdXBfd2hpdGVfdHNoaV85YjNmOWZjZS03MTZkLTQxYmUtODkzZS05MzkwZWY1NmZiZmFfMi5qcGc.jpg'],
        variants: [],
        sizes: [],
      ),
      ProductDTO(
        id: 'id_3',
        name: 'Футболка 3',
        price: 1500,
        images: ['http://localhost:8000/berserk.png'],
        variants: [],
        sizes: [],
      ),*/
    ];
  }
}
