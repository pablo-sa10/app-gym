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
      appBar: AppBarBuild(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            for(int i = 0; i < 4; i++)
            InkWell(
              child: Card(
                child: Row(
                  children: [
                    Container(
                      width: 280,
                      height: 150,
                      color: Colors.red,
                    ),
                    Column(
                      children: [
                        Text("Titulo"),
                        Text("Subtitulo")
                      ],
                    )
                  ],
                ),
              ),
              onTap: (){},
            )
          ],
        ),
      ),
    );
  }
}
