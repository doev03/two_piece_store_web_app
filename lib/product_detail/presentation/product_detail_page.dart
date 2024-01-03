import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/data/data_sources/firebase_storage_data_source.dart';
import '../data/data_sources/product_detail_remote_data_source.dart';
import '../data/repository/product_detail_repository.dart';
import '../domain/usecase/get_attributes_map.dart';
import '../domain/usecase/get_product.dart';
import '../domain/usecase/get_products_by_join_name.dart';
import 'bloc/product_detail_bloc.dart';
import 'widgets/body.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    required this.id,
    super.key,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final productRepository = ProductDetailRepositoryImpl(
          remoteDataSource: ProductDetailRemoteDataSourceImpl(
            firebaseFirestore: FirebaseFirestore.instance,
          ),
          firebaseStorageDataSource: FirebaseStorageDataSourceImpl(
            instance: FirebaseStorage.instance,
          ),
        );
        return ProductDetailBloc(
          getProduct: GetProduct(productRepository: productRepository),
          getAttributesMap: GetAttributesMap(productRepository: productRepository),
          getProductsByJoinName: GetProductsByJoinName(productRepository: productRepository),
        );
      },
      child: ProductDetailView(id: id),
    );
  }
}

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({
    required this.id,
    super.key,
  });

  final String id;

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailBloc>().add(ProductDetailPageInit(productId: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.secondary,
      child: const ProductDetailPageBody(),
    );
  }
}
