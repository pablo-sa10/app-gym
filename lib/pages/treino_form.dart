import 'package:flutter/material.dart';

class TreinoForm extends StatefulWidget {
  const TreinoForm({super.key});

  @override
  State<TreinoForm> createState() => _TreinoFormState();
}

class _TreinoFormState extends State<TreinoForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: null,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 10),
      ),
    );
  }
}
