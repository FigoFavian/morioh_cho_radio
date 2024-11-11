import 'package:flutter/material.dart';
import 'package:morioh_cho_radio/widgets/left_drawer.dart';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 233, 231, 154),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Product yang kamu mau',
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 65, 133, 137),
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
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
                    hintText: "Amount",
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 153, 155, 204),
                    ),
                    labelText: "Amount",
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
                      _amount = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Amount tidak boleh kosong!";
                    }
                    int? amount = int.tryParse(value);
                    if (amount == null) {
                      return "Amount harus berupa angka!";
                    }
                    if (amount <= 0) {
                      return "Amount harus lebih dari 0!";
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
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(255, 153, 155, 204),
                              title: const Text('Product berhasil tersimpan'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Product: $_name'),
                                    Text('Amount: $_amount'),
                                    Text('Description: $_description')
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
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
