import 'package:flutter/material.dart';
import 'package:morioh_cho_radio/screens/menu.dart';
import 'package:morioh_cho_radio/screens/productentry_form.dart';
import 'package:morioh_cho_radio/screens/list_productentry.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 233, 231, 154),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 65, 133, 137),
            ),
            child: const Column(
              children: [
                Text(
                  'Morioh Cho Radio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 247, 211),
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Erm what the sig-",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 255, 247, 211),
                  ),
                ),
              ],
            ),
          ),
          
          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.white),
            title: const Text(
              'Daftar Produk',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductEntryPage()),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.home_outlined, color: Colors.white),
            title: const Text(
              'Main Page',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ),
              );
            },
          ),

          ListTile(
            leading:
                const Icon(Icons.production_quantity_limits, color: Colors.white),
            title: const Text(
              'Tambah Product',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductEntryFormPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
