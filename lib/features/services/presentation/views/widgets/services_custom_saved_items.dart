import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';

class ServicesCustomSavedItems extends StatelessWidget {
  const ServicesCustomSavedItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () {},
        title: const Text('Saved items'),
        leading: ClipOval(
          child: Container(
            color: const Color.fromARGB(255, 210, 243, 255),
            height: 50,
            width: 50,
            child: const Icon(
              Icons.bookmark,
              size: 28,
              color: Color.fromARGB(255, 29, 199, 255),
            ),
          ),
        ),
        trailing: const Icon(IconlyBroken.arrowRight2),
      ),
    );
  }
}
