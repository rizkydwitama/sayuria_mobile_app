import 'package:flutter/material.dart';
import 'package:sayuria/pages/home/main_page.dart';

void main() => runApp(const SayuriaApp());

class SayuriaApp extends StatelessWidget {
  const SayuriaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/' : (context) => const MainPage(),
      },

      debugShowCheckedModeBanner: false,
    );
  }
}



