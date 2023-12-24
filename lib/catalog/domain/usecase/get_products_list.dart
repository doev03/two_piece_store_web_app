import '../../../core/utils/usecase.dart';
import '../../data/repository/catalog_repository.dart';
import '../entity/catalog_item.dart';

class GetProductsList extends UseCase<List<CatalogItemEntity>, void> {
  GetProductsList({
    required CatalogRepository catalogRepository,
  }) : _catalogRepository = catalogRepository;

  final CatalogRepository _catalogRepository;

  @override
  Future<List<CatalogItemEntity>> call(void params) {
    return _catalogRepository.getProductsList();
  }
}

class GetProductsListParams {}
