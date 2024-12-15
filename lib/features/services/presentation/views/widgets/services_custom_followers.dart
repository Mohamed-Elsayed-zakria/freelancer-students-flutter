import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';

class ServicesCustomFollowers extends StatelessWidget {
  const ServicesCustomFollowers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () {},
        title: const Text('Followers'),
        leading: ClipOval(
          child: Container(
            color: const Color.fromARGB(249, 203, 203, 255),
            height: 50,
            width: 50,
            child: const Icon(
              Icons.people_alt_sharp,
              size: 28,
              color: Color.fromARGB(255, 85, 88, 255),
            ),
          ),
        ),
        trailing: const Icon(IconlyBroken.arrowRight2),
      ),
    );
  }
}
