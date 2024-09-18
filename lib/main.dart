import 'package:flutter/material.dart';

import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Wallet App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

void main() {
  runApp(TransaksiApp());
}

class TransaksiApp extends StatelessWidget {
  const TransaksiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RiwayatTransaksi(),
    );
  }
}

class RiwayatTransaksi extends StatelessWidget {
  final List<Map<String, String>> transaksi = [
    {
      "tanggal": "10 Sep 2024",
      "deskripsi": "Pembelian Online",
      "jumlah": "-Rp 350.000"
    },
    {
      "tanggal": "05 Sep 2024",
      "deskripsi": "Transfer Masuk",
      "jumlah": "+Rp 2.000.000"
    },
    {
      "tanggal": "03 Sep 2024",
      "deskripsi": "Tarik Tunai",
      "jumlah": "-Rp 900.000"
    },
    {
      "tanggal": "01 Sep 2024",
      "deskripsi": "Gaji Bulanan",
      "jumlah": "+Rp 7.000.000"
    },
  ];

  const RiwayatTransaksi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Transaksi'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: transaksi.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(
              transaksi[index]["jumlah"]!.contains('+')
                  ? Icons.arrow_downward
                  : Icons.arrow_upward,
              color: transaksi[index]["jumlah"]!.contains('+')
                  ? Colors.green
                  : Colors.red,
            ),
            title: Text(transaksi[index]["deskripsi"]!),
            subtitle: Text(transaksi[index]["tanggal"]!),
            trailing: Text(
              transaksi[index]["jumlah"]!,
              style: TextStyle(
                color: transaksi[index]["jumlah"]!.contains('+')
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
