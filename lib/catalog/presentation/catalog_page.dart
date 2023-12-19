import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/page_box.dart';
import '../data/data_sources/catalog_remote_data_source.dart';
import '../data/repository/catalog_repository.dart';
import '../domain/usecase/get_products_list.dart';
import 'bloc/catalog_cubit.dart';
import 'widgets/body.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CatalogCubit(
        getProductsList: GetProductsList(
          catalogRepository: CatalogRepositoryImpl(
            remoteDataSource: CatalogRemoteDataSourceTest(),
          ),
        ),
      ),
      child: const CatalogView(),
    );
  }
}

class CatalogView extends StatefulWidget {
  const CatalogView({super.key});

  @override
  State<CatalogView> createState() => _CatalogViewState();
}

class _CatalogViewState extends State<CatalogView> {
  @override
  void initState() {
    super.initState();
    context.read<CatalogCubit>().fetchProductsList();
  }

  @override
  Widget build(BuildContext context) {
    return const PageBox(
      child: Body(),
    );
  }
}