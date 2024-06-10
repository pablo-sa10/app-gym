import 'package:fitness/pages/home.dart';
import 'package:fitness/pages/treino_form.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitness',
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(),
        "/Treino_Form": (context) => const TreinoForm(),
      },
    );
  }
}


