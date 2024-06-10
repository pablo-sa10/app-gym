import 'package:fitness/pages/list_exercises.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarBuild(),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 70),
        child: ListView(
          children: [
            for (int i = 1; i < 6; i++)
              ListExercises(
                exercise: i,
              )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/Treino_Form");
            },
            child: const Text(
              "Adicionar Novo Treino",
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFFB8E0E),
            ),
          ),
        ),
      ),
    );
  }
}
