import 'package:flutter/material.dart';

import '../styles/typography.dart';
import 'page_box.dart';

class NotFoundPage extends Page<void> {
  const NotFoundPage({super.key});

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(settings: this, builder: build);
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PageBox(
      child: Center(
        child: Text(
          'Страница не найдена',
          style: AppTypography.title3.copyWith(color: theme.colorScheme.onBackground),
        ),
      ),
    );
  }
}
