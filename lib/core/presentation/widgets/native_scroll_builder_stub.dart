import 'package:flutter/material.dart';

class NativeScrollBuilder extends StatefulWidget {
  const NativeScrollBuilder({
    required this.builder,
    super.key,
  });

  final Widget Function(BuildContext context, ScrollController controller) builder;

  @override
  State<NativeScrollBuilder> createState() => _NativeScrollBuilderState();
}

class _NativeScrollBuilderState extends State<NativeScrollBuilder> {
  final _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _controller);
  }
}
