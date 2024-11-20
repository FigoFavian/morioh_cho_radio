import 'package:flutter/material.dart';
import 'package:morioh_cho_radio/widgets/left_drawer.dart';
import 'package:morioh_cho_radio/widgets/product_card.dart';
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final String npm = '2306241764'; // NPM
  final String name = 'Figo Favian Ragazo'; // Nama
  final String className = 'PBP F'; // Kelas

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.production_quantity_limits, Color.fromARGB(255, 20, 29, 73)),
    ItemHomepage("Tambah Produk", Icons.add, Color.fromARGB(255, 45, 67, 128)),
    ItemHomepage("Logout", Icons.logout, Color.fromARGB(255, 59, 67, 105)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 231, 154),
      appBar: AppBar(
        title: const Text(
          'Morioh Cho Radio',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 247, 211),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 133, 137),
      ),

      drawer: const LeftDrawer(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoCard(title: 'NPM', content: npm),
                InfoCard(title: 'Nickname', content: name),
                InfoCard(title: 'Class', content: className),
              ],
            ),

            const SizedBox(height: 16.0),
            Center(
              child: Column(

                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Good Morning Morioh Cho~',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                  GridView.count(
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 153, 155, 204),
      elevation: 2.0,
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Color.fromARGB(255, 255, 247, 211)),
            ),
            const SizedBox(height: 8.0),
            Text(content, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

