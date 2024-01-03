import 'package:flutter/material.dart';

import '../../../core/styles/spacings.dart';
import '../../../core/styles/theme.dart';
import 'images_carousel_indicator.dart';

class ImagesCarousel extends StatefulWidget {
  const ImagesCarousel({
    required this.images,
    this.horizontalSpacing = 0,
    super.key,
  });

  final List<ImageProvider> images;
  final double horizontalSpacing;

  @override
  State<ImagesCarousel> createState() => _ImagesCarouselState();
}

class _ImagesCarouselState extends State<ImagesCarousel> {
  static const _initialPage = 0;

  final _pageController = PageController();
  final _pageNotifier = ValueNotifier(_initialPage);

  @override
  void initState() {
    _pageController.addListener(() {
      _pageNotifier.value = _pageController.page?.round() ?? 0;
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 3 / 4,
          child: PageView(
            controller: _pageController,
            children: List.generate(widget.images.length, (index) {
              final image = widget.images[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.horizontalSpacing),
                child: ClipRRect(
                  borderRadius: primaryBorderRadius,
                  child: Image(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: spacing3),
        ValueListenableBuilder(
          valueListenable: _pageNotifier,
          builder: (context, page, child) {
            return ImagesCarouselIndicator(
              page: page,
              pageCount: widget.images.length,
            );
          },
        ),
      ],
    );
  }
}
