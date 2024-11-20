import 'package:morioh_cho_radio/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:morioh_cho_radio/models/product_entry.dart';
import 'package:morioh_cho_radio/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryPage extends StatefulWidget {
  const ProductEntryPage({super.key});

  @override
  State<ProductEntryPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductEntryPage> {
  Future<List<ProductEntry>> fetchProducts(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');
    
    var data = response;
    
    List<ProductEntry> listProducts = [];
    for (var d in data) {
      if (d != null) {
        listProducts.add(ProductEntry.fromJson(d));
      }
    }
    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 231, 154), // Background theme color
      appBar: AppBar(
        title: const Text('List of Products'),
        backgroundColor: const Color.fromARGB(255, 65, 133, 137), // AppBar theme color
        foregroundColor: Color.fromARGB(255, 255, 247, 211),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 153, 155, 204), // Loader color
              ),
            );
          } else {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Column(
                children: [
                  Text(
                    'Tidak ada product',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 170, 0, 0), // Text color for empty state
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final product = snapshot.data![index].fields;

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetails(
                            name: product.name,
                            price: product.price,
                            description: product.description,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 59, 67, 105), // Card background color
                        border: Border.all(
                          color: const Color.fromARGB(255, 20, 29, 73), // Border color
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name: ${product.name}",
                            style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 247, 211), // Text color for the name
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Price: ${product.price}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 247, 211), // Text color for price
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Description: ${product.description}",
                            style: const TextStyle(
                              color: Color.fromARGB(255, 255, 247, 211), // Text color for description
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
