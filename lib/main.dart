import 'package:flutter/material.dart';
import 'package:sayuria/pages/home/main_page.dart';
import 'package:sayuria/pages/product_detail.dart';

void main() => runApp(const SayuriaApp());

class SayuriaApp extends StatelessWidget {
  const SayuriaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => const MainPage(),
        '/product-detail/' : (context) => const ProductDetail(),
      },

      debugShowCheckedModeBanner: false,
    );
  }
}



