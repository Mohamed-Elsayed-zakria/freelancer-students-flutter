import 'package:flutter/material.dart';

class MainHomeScreenBody extends StatelessWidget {
  final int pageNumber;

  const MainHomeScreenBody({
    super.key,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: pageNumber,
      children: const [
        Text("data"),
        Text("data"),
        Text("data"),
        Text("data"),
        Text("data"),
      ],
    );
  }
}
