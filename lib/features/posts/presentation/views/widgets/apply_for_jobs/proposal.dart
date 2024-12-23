import 'package:flutter/material.dart';

class Proposal extends StatelessWidget {
  const Proposal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Write A Proposal To The Client",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          maxLength: 500,
          maxLines: 15,
          decoration: InputDecoration(
            hintText: "Proposal Max 500 Letter / 15 Lines",
            // Add border
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners
              borderSide: const BorderSide(
                color: Colors.grey, // Border color
                width: 1.0, // Border width
              ),
            ),
            // Border when TextField is enabled but not focused
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.grey, // Light grey border
                width: 1.0,
              ),
            ),
            // Border when TextField is focused
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.blue, // Blue border
                width: 2.0, // Thicker border
              ),
            ),
          ),
        ),
      ],
    );
  }
}
