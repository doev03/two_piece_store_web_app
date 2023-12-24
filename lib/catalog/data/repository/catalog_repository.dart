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
    return data
        .map(
          (e) => CatalogItemEntity(
            categoryId: e.categoryId,
            id: e.id,
            images: e.images,
            name: e.name,
            price: e.price,
          ),
        )
        .toList();
  }
}
