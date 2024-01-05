import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/presentation/page_progress_indicator.dart';
import '../../../core/presentation/widgets/adaptive_scroll_builder.dart';
import '../../../core/styles/spacings.dart';
import '../../../core/styles/typography.dart';
import '../../domain/entity/attribute.dart';
import '../../domain/entity/product.dart';
import '../bloc/product_detail_bloc.dart';
import 'attribute_picker.dart';
import 'image_picker_item.dart';
import 'images_carousel.dart';
import 'price_box.dart';
import 'text_picker_item.dart';

class ProductDetailPageBody extends StatelessWidget {
  const ProductDetailPageBody({super.key});

  void _selectAttribute(BuildContext context, ProductEntity selectedProduct) {
    context.read<ProductDetailBloc>().add(
          ProductDetailAttributeChanged(selectedProduct: selectedProduct),
        );
  }

  Widget _buildVariableAttributes({
    required BuildContext context,
    required ProductEntity product,
    required Map<String, AttributeEntity> attributesMap,
    required List<ProductEntity> joinedProducts,
  }) {
    final productVariableAttributes = product.attributes.where(
      (attrParams) {
        final attribute = attributesMap[attrParams.attributeId];
        return attribute != null &&
            attribute.isVariable &&
            attribute.pickerType != AttributePickerType.other;
      },
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: productVariableAttributes.map((productAttribute) {
        final productAttributeInfo = attributesMap[productAttribute.attributeId]!;

        final products = <ProductEntity>[];
        for (final item in joinedProducts) {
          if (item.id == product.id) {
            products.add(item);
            continue;
          }

          // Добавляет товар в список, если выполняются следующие условия:
          // * значение атрибута c id равным [productAttribute.attributeId] текущего товара отличается от значения атрибута объединенного товара [item].
          // * все остальные атрибуты текущего товара равны соответствующим аттрибутам объединенного товара.
          void addProductWithSameAttributes() {
            for (final itemAttr in item.attributes) {
              if (itemAttr.attributeId == productAttribute.attributeId) {
                if (itemAttr.name == productAttribute.name) {
                  return;
                }
              } else {
                if (itemAttr.name != product.getAttributeById(itemAttr.attributeId).name) {
                  return;
                }
              }
            }
            products.add(item);
          }

          addProductWithSameAttributes();
        }

        products.sort(
          (a, b) => a
              .getAttributeById(productAttribute.attributeId)
              .name
              .compareTo(b.getAttributeById(productAttribute.attributeId).name),
        );

        return Padding(
          padding: const EdgeInsets.only(bottom: spacing3),
          child: AttributePicker(
            horizontalSpacing: spacing5,
            heading: '${productAttributeInfo.name}: ${productAttribute.name}',
            children: List.generate(products.length, (index) {
              final item = products[index];
              final attrParams = item.getAttributeById(productAttributeInfo.id);
              final selected = product.offerId == item.offerId;

              switch (productAttributeInfo.pickerType) {
                case AttributePickerType.text:
                  return TextPickerItem(
                    attrParams.name,
                    selected: selected,
                    onPressed: () {
                      _selectAttribute(context, item);
                    },
                  );
                case AttributePickerType.image:
                  return ImagePickerItem(
                    item.images.first,
                    selected: selected,
                    onPressed: () {
                      _selectAttribute(context, item);
                    },
                  );
                case AttributePickerType.other:
                  throw UnimplementedError();
              }
            }),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return BlocBuilder<ProductDetailBloc, ProductDetailState>(
      builder: (context, state) {
        final product = state.product;
        final attributesMap = state.attributesMap;
        final joinedProducts = state.joinedProducts;

        if (product == null) {
          return const PageProgressIndicator();
        }

        const horizontalPadding = EdgeInsets.symmetric(horizontal: spacing5);
        const gap = SizedBox(height: spacing5);

        return AdaptiveScrollBuilder(
          builder: (context, controller) {
            return ListView(
              controller: controller,
              children: [
                gap,
                ImagesCarousel(
                  horizontalSpacing: spacing5,
                  images: [product.images.first, product.images.first],
                ),
                gap,
                Padding(
                  padding: horizontalPadding,
                  child: Text(
                    product.name,
                    style: AppTypography.title2.copyWith(color: colorScheme.onBackground),
                  ),
                ),
                gap,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: horizontalPadding,
                    child: PriceBox(
                      price: product.price,
                    ),
                  ),
                ),
                gap,
                if (attributesMap != null && joinedProducts != null)
                  _buildVariableAttributes(
                    context: context,
                    product: product,
                    attributesMap: attributesMap,
                    joinedProducts: joinedProducts,
                  ),
                const SizedBox(height: spacing3),
              ],
            );
          },
        );
      },
    );
  }
}
