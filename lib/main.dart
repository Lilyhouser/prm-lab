import 'package:flutter/material.dart';
import 'package:prm393_lab/entities/ui/BottomNavigation.dart';
import 'package:prm393_lab/pages/home_page.dart';
import 'package:prm393_lab/pages/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
      title: "Lily Lab 4",
    );
  }
}
