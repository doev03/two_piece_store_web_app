import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'native_scroll_builder_web.dart' if (dart.library.io) 'native_scroll_builder_stub.dart';

class AdaptiveScrollBuilder extends StatelessWidget {
  const AdaptiveScrollBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(BuildContext context, ScrollController? controller) builder;

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
        return NativeScrollBuilder(
          builder: builder,
        );
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
        return builder(context, null);
    }
  }
}
