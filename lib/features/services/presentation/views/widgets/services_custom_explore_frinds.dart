import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';

class ServicesCustomExploreFrinds extends StatelessWidget {
  const ServicesCustomExploreFrinds({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () {},
        title: const Text('Explore jobs'),
        leading: ClipOval(
          child: Container(
            color: const Color.fromARGB(189, 246, 202, 255),
            height: 50,
            width: 50,
            child: const Icon(
              Icons.search,
              size: 28,
              color: Color.fromARGB(255, 187, 0, 255),
            ),
          ),
        ),
        trailing: const Icon(IconlyBroken.arrowRight2),
      ),
    );
  }
}
