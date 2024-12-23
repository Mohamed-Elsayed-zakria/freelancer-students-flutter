import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Benifit extends StatelessWidget {
  const Benifit({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Bid Details",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Fixed or Per Hour"),
                ],
              ),
              Column(
                children: [Text("Price In Dollars")],
              ),
              Column(
                children: [Text("Days")],
              )
            ],
          )
        ],
      ),
    );
  }
}
