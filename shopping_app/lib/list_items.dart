import 'package:flutter/material.dart';

class ListProduct extends StatelessWidget {
  const ListProduct(
      {super.key,
      required this.text,
      required this.amount,
      required this.image,
      required this.background});
  final String text;
  final double amount;
  final String image;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(216, 240, 253, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            '\$$amount',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Center(
            child: Image.asset(
              image,
              height: 170,
            ),
          )
        ],
      ),
    );
  }
}
