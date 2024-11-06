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