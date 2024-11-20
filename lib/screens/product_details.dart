import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String name;
  final int price;
  final String description;

  const ProductDetails({
    super.key,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 231, 154), // Background theme color
      appBar: AppBar(
        title: Text(name),
        backgroundColor: const Color.fromARGB(255, 65, 133, 137), // AppBar theme color
        foregroundColor: const Color.fromARGB(255, 255, 247, 211), // Foreground (text/icon) color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Product Name: $name",
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 59, 67, 105), // Text color for name
              ),
            ),
            const SizedBox(height: 20),
            Text(
              price == 0 ? "Price: FREE" : "Price: $price",
              style: const TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(255, 20, 29, 73), // Text color for price
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Description: $description",
              style: const TextStyle(
                fontSize: 16.0,
                color: Color.fromARGB(255, 20, 29, 73), // Text color for description
              ),
            ),
          ],
        ),
      ),
    );
  }
}
