import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './provider/count_and_slash_provider.dart';
import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountandSlashProvider()),
      ],
      builder: (BuildContext context, child) {
        return MaterialApp(
          home: HomePage(),
        );
      },
    );
  }
}
