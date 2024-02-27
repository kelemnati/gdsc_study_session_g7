import 'package:flutter/material.dart';

import 'book_store.dart';
import 'form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "GDSC BOOK STORE",
      routes: {
        '/bookDetails': (context) => const BookStore(),
      },
      home: const FormPage(),
    );
  }
}
