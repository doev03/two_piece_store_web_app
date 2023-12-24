part of 'catalog_cubit.dart';

sealed class CatalogState extends Equatable {}

final class CatalogInitial extends CatalogState {
  @override
  List<Object?> get props => [];
}

final class CatalogInProgress extends CatalogState {
  @override
  List<Object?> get props => [];
}

final class CatalogSuccess extends CatalogState {
  CatalogSuccess({
    required this.items,
  });

  final List<CatalogItemEntity> items;

  @override
  List<Object?> get props => [items];
}

final class CatalogFailure extends CatalogState {
  @override
  List<Object?> get props => [];
}
