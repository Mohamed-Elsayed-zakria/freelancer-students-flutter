import 'package:flutter/material.dart';
import 'package:freelancer/core/constant/style.dart';

class ProfileViewWorkHistory extends StatelessWidget {
  const ProfileViewWorkHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
          width: 3,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          const Text(
            "Need A Software Engineer To Digitalize My Grocery Store",
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade700,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade700,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade700,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade700,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade700,
                  )
                ],
              ),
              const Text(
                "Aug 6, 2024 - Aug 29, 2024",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "He went above and beyond to make sure that the work was done correctly.",
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "\$30",
                style: AppStyle.kTextStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$5/hr",
                style: AppStyle.kTextStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "6 hours",
                style: AppStyle.kTextStyle16.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
