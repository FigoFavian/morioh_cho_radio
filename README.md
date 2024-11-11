# Tugas PBP

> A Flutter Project for an E-Commerce

<details>
    <summary>Tugas 7 💻</summary>

### 🟦🟥 Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya. 

> Stateless widget: 
Stateless widget adalah sebuah class widget yang tidak berubah (bersifat statis) dan tidak akan berubah statenya selama aplikasi berjalan.

> Stateful widget:
Stateful widget adalah sebuah class widget yang statenya dapat berubah salama aplikasi berjalan.


> Perbedaan:
Perbedaan dari kedua widget tersebut berada pada penggunaanya, yang di mana stateful dapat mengubah widget agar tampilan terlihat lebih dinamis, sebagai contoh yaitu suatu tombol. Sementara stateless tidak dapat mengubah widget seperti stateful, sebagai contoh yaitu gambar atau text yang static. 

### 🟦🟥 Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

Saya mengunakkan widget built-in flutter dan widget buatan sendiri.

> widget built-in flutter:

`MaterialApp:` Yang mengatur keseluruahan sistem kerja aplikasi dan sebagai root dari seluruh antarmuka aplikasi flutter

`Material:` Memfasilitasikan visual effect utk widget

`InkWell:` saat user meng-click suatu elemen, akan terlihat effect ripple / gelombang di posisi elemen tersebut

`ScaffoldMessenger:` Mengkonfigurasi Snackbar dan juga menampilkannya

`SnackBar:` Menampilkan pesan setelah melakukan suatu aksi di layar pada bagian paling bawah

`Text:` menampilkan text dan style nya

`Container:` Mengatur letak, ukuran widget, dan memperindah tampilan antarmuka

`Center:` dapat memposisikan spesifik widget di tengah layar

`Column:` menyusun spesifik widget menjadi vertikal

`Icon:` Menampilkan icon dari Material Design Icon

`Padding:` Membuat space di antara widget lainnya

`Scaffold:` menyediakan banyak widget seperti SnackBar, FloatingActionButton, AppBar, dll

`AppBar:` Untuk menampilkan bar di atas layar

`Row:`  menyusun spesifik widget menjadi vertikal

`SizedBox:` menambahkan jarak secara vertikal maupun horizontal atau sebagai container kosong

`GridView:` menampilkan widget dalam grid sesuai letaknya

> widget buatan:

`MyApp:` main widget

`MyHomePage:` menampilkan halaman utama dari aplikasi

`ItemCard:` menampilkan informasi sesuai item dengan format card

`InfoCard:` menampilkan informasi secara detail dengan format card

### 🟦🟥 Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

setState() digunakan dalam Stateful Widget untuk membuat ulang atau memperbarui tampilan widget karena terjadinya perubaha pada state widget maupun data. Oleh sebab itu, variabel yang dapat terdampak adalah build() yang akan merender ulang tampilan terbaru.

### 🟦🟥 Jelaskan perbedaan antara const dengan final.

> const:
conts digunakan widget yang dimana valuenya sudah constant / tidak dapat berubah sebelum di run / di compile. const dapat di optimalisasi pd kompilasi, karena nilainya sudah pasti.

> final:
final hanya digunakan sekali dan value dari variabel tsb perlu diinisialiasi sebelum di run / di compile. final mengunci variabel agar tidak dapat diubah setelah diinisialisasi.

### 🟦🟥 Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

Sebelumnya, saya melakuan setup seperti biasanya yaitu: membuat project flutter baru > membuat repo baru > membuat webhook ke discord > kemudian menyambungkan directory ke repo.

Flutter akan menyediakan template untuk project saya. Setelah itu saya memindahkan widget buatan seperti `MyHomePage`, `ItemCard`, `InfoCard`, `ItemHomePage` ke menu.dart, mengkonfigurasi perubahan, dan handling beberapa error setelah perubahan tersebut. `InfoCard` berfungsi untuk menampikan data user.`ItemHomePage` akan menjadi field untuk `ItemCard`. Kemudian `ItemCard` akan memunculkan SnackBar jika sebuah tombol di click. Kemudian, saya mengubah `MyHomePage` menjadi stateless widget karena halaman tidak perlu perubahan state.

Untuk mengimplementasikan warna-warna yang berbeda untuk setiap tombol, saya menggunakan `Color.fromARGB(255,...,...,...))` untuk memilih warna secara spesifik 
Berikut beberapa contoh implementasinya:

```dart
...
ItemHomepage("Lihat Daftar Produk", Icons.mood, Color.fromARGB(255,20,29,73)), 
ItemHomepage("Tambah Produk", Icons.add, Color.fromARGB(255,45,67,128)), 
ItemHomepage("Logout", Icons.logout, Color.fromARGB(255,59,67,105)), 
...
backgroundColor: const Color.fromARGB(255, 65, 133, 137),
...
color: const Color.fromARGB(255, 153, 155, 204),
...
```
</details>

<details>
    <summary>Tugas 8 💻</summary>

### 🟦🟥 Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

Pertama-tama saya menambah directory baru bernama screens yang berisi menu.dart dan productentry_form.dart. 
File menu.dart digunakan untuk main page dan product_entry_form.dart digunakan utk halaman formulir penambahan item baru. 
Kemudian saya mengimplementasikan ketiga elemen name, amount, description dan juga tombol save untuk menyimpan data di dalam 
productentry_form.dart dengan menginisiasinya di ProductEntryFormPage. Untuk masing masing elemen terdapat validasi masing masing:
a. name tidak boleh kosong, tidak boleh kurang dari 4 karakter, dan tidak boleh lebih dari 25 karakter.
b. amount tidak boleh kosong, tidak boleh bilangan yang bukan integer, dan tidak boleh bernilai negatif
c. description tidak boleh kosong, tidak boleh kurang dari 7 karakter, dan tidak boleh lebih dari 30 karakter.

Kedua saya membuat directory bari bernama widgets yang berisi left_drawer.dart dan product_card.dart. Class itemHomePage dan class itemCard dari menu saya pindahkan ke product_cards.dart. Tujuannya adalah untuk memisahkan file dart yg dapat digunakan beberapa kali utk aplkasi .Untuk membuat drawer, saya membuat drawer yang akan tampil pada bagian kiri layar, maka file tsb dinamakan left_drawer.dart. Di dalam left drawer, saya membuat routing ke halaman utama dan halaman form product entry yaitu ke menu.dart dan product_entry_form.dart.

Untuk tahap selanjutnya saya menambahkan fitur navigasi dari halaman utama menuju halaman form penambahan item baru. Pada halaman utama di menu.dart tombol Tambah Item akan memindahkan user ke halaman ProductEntryFormPage.

Kemudian saya mengimplementasikan fitur pop up setelah user menekan tombol Save di halaman product_entry_form.dart.


### 🟦🟥 Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?

const di Flutter digunakan untuk menentukan objek / value yang immutable pada kompilasi. maka value tsb tidak akan berubah selama kompilasi berjalan. Oleh karena itu keuntungannya berupa penghematan penggunaan memory karena value memory hanya dibentuk sekali saja. 

const sebaiknya digunakan saat objek tidak akan berubah selama runtime (static). Sebaliknya jangan digunakan ketika objek harus diperbarui secara dinamis karena value tsb akan berpengaruh pada input user saat aplikasi berjalan.

### 🟦🟥 Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!

Column dan Row merupakan widget layout di Flutter utk peletakan widget secara vertikal(Column) dan horizontal(Vertikal).

Column:
```dart
child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('Product: $_name'),
    Text('Amount: $_amount'),
    Text('Description: $_description')
    ],
),
```

Row:
```dart
child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
        ...
    ],
),
```

### 🟦🟥 Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!

Elemen yang saya gunakan adalah ElevatedButton untuk menyimpan data setelah pengguna mengisi form dan TextFormField untuk memasukan nama Product, Amount, dan Description.
Elemen lain yang saya tidak gunakan seperti RadioButton, Slider, Checkbox, dll karena tidak perlu diimplementasika fitur fitur tersebut.

### 🟦🟥 Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?

Theme dapat diatur dengan menggunakan ThemeData pada widget MaterialApp agar warna, font, dan style konsisten di semua file. Saya mengimplementasikannya pada main.dart:

```dart
theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.blue,
    ).copyWith(secondary: const Color.fromARGB(255, 163, 201, 92)),
),
```

### 🟦🟥 Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?

Terdapat widget Navigator dan method pop, push, dan pushreplacement untuk menangani navigasi dlm aplikasi.

Navigasi ke halaman form product entry (push)
```dart
Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => const ProductEntryFormPage(),
    ),
);
```

Navigasi ke halaman utama (pushreplacement)
```dart
Navigator.pushReplacement(
    context,
    MaterialPageRoute(
        builder: (context) => MyHomePage(),
    ),
);
```

Menutup / kembali ke halaman sebelumnya (pop)
```dart
onPressed: () {
    Navigator.pop(context);
    _formKey.currentState!.reset();
},
```

</details>