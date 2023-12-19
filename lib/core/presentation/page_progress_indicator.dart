import 'package:flutter/material.dart';

class PageProgressIndicator extends StatelessWidget {
  const PageProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator.adaptive());
  }
}
