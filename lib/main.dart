import "package:bloc_and_firebase/features/home/home_page.dart";
import "package:bloc_and_firebase/features/posts/ui/post_page.dart";
import "package:flutter/material.dart";

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostPage(),
    );
  }
}
