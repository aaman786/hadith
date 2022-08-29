import 'package:flutter/material.dart';
import 'package:hadees/screens/books.dart';
import 'package:hadees/screens/collection.dart';
import 'package:hadees/screens/hadith.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: "/",
      routes: {
        "/": (_) => const CollectionScreen(),
        "books": (_) => const BooksScreen(),
        "hadith": (_) => const HadithScren(),
      },
    );
  }
}
