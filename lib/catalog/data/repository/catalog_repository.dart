import '../../../core/domain/entity/product.dart';
import '../data_sources/catalog_remote_data_source.dart';

// ignore: one_member_abstracts
abstract class CatalogRepository {
  Future<List<ProductEntity>> getProductsList();
}

class CatalogRepositoryImpl implements CatalogRepository {
  CatalogRepositoryImpl({
    required CatalogRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final CatalogRemoteDataSource _remoteDataSource;

  @override
  Future<List<ProductEntity>> getProductsList() async {
    final data = await _remoteDataSource.getProductList();
    return data
        .map(
          (e) => ProductEntity(
            id: e.id,
            name: e.name,
            price: e.price,
            images: e.images,
            variants: e.variants,
            sizes: e.sizes,
          ),
        )
        .toList();
  }
}
