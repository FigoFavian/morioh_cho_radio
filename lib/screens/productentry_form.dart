import 'dart:convert';
import 'package:morioh_cho_radio/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _price = 0;
  String _description = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 231, 154),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Tambah Product yang kamu mau',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 133, 137),
        foregroundColor: Color.fromARGB(255, 255, 247, 211),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Product Name",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 153, 155, 204),
                    ),
                    labelText: "Product",
                    labelStyle: const TextStyle(
                      color: Colors.black, // Warna label ketika tidak fokus
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color.fromARGB(255, 153, 155, 204), // Warna label ketika fokus
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 153, 155, 204), // Warna border ketika fokus
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Warna border ketika tidak fokus
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama product tidak boleh kosong!";
                    }
                    if (value.length < 4) {
                      return "Nama product harus minimal 4 karakter!";
                    }
                    if (value.length > 25) {
                      return "Nama product tidak boleh lebih dari 25 karakter!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 153, 155, 204),
                    ),
                    labelText: "Price",
                    labelStyle: const TextStyle(
                      color: Colors.black, // Warna label ketika tidak fokus
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color.fromARGB(255, 153, 155, 204), // Warna label ketika fokus
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 153, 155, 204), // Warna border ketika fokus
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Warna border ketika tidak fokus
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price tidak boleh kosong!";
                    }
                    int? price = int.tryParse(value);
                    if (price == null) {
                      return "Price harus berupa angka!";
                    }
                    if (price <= 0) {
                      return "Price harus lebih dari 0!";
                    }
                    return null;
                  },
                ),
              ),

              // Field untuk Description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 153, 155, 204),
                    ),
                    labelText: "Description",
                    labelStyle: const TextStyle(
                      color: Colors.black, // Warna label ketika tidak fokus
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color.fromARGB(255, 153, 155, 204), // Warna label ketika fokus
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 153, 155, 204), // Warna border ketika fokus
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(
                        color: Colors.black, // Warna border ketika tidak fokus
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description tidak boleh kosong!";
                    }
                    if (value.length < 7) {
                      return "Description harus minimal 7 karakter!";
                    }
                    if (value.length > 30) {
                      return "Description tidak boleh lebih dari 30 karakter!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                          const Color.fromARGB(255, 59, 67, 105)),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final response = await request.postJson(
                                "http://localhost:8000/create-flutter/",
                                jsonEncode(<String, String>{
                                    'name': _name,
                                    'price': _price.toString(),
                                    'description': _description,
                                }),
                            );
                            if (context.mounted) {
                                if (response['status'] == 'success') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                    content: Text("Product baru berhasil disimpan!"),
                                    ));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        content:
                                            Text("Terdapat kesalahan, silakan coba lagi."),
                                    ));
                                }
                            }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Color.fromARGB(255, 255, 247, 211)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
