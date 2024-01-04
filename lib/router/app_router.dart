import 'package:auto_route/auto_route.dart';

import '../catalog/presentation/catalog_page.dart';
import '../product_detail/presentation/product_detail_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: CatalogRoute.page),
    AutoRoute(path: '/product/:id', page: ProductDetailRoute.page),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}
