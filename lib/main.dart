import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poisk_raboty/setup.dart';

import 'features/home_page/presentation/pages/home_page.dart';

void main() async {
  await configureDependencies();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
