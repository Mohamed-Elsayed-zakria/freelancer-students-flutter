import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  final WidgetBuilder smallView, mediumView, largeView;
  const AdaptiveLayout({
    super.key,
    required this.smallView,
    required this.mediumView,
    required this.largeView,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        switch (constraints.maxWidth) {
          case > 1100:
            return largeView(context);
          case > 800:
            return mediumView(context);
          default:
            return smallView(context);
        }
      },
    );
  }
}
