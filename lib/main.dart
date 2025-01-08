import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DetailScreen());
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            child: const Text(
              'Farm House lembang',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.calendar_today_rounded),
                    Text('Open Every Day'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.access_time),
                    Text('09:00 - 20:00'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.monetization_on_outlined),
                    Text('Rp. 25.000'),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 10,
            ),
            child: const Text(
              'Berada di jalur utama Bandung Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto Instagramable',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
