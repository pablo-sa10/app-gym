import 'package:flutter/material.dart';

class TreinoForm extends StatefulWidget {
  const TreinoForm({super.key});

  @override
  State<TreinoForm> createState() => _TreinoFormState();
}

class _TreinoFormState extends State<TreinoForm> {
  //CHAVES PARA VALIDAÇÃO DE FORM
  final _formKey = GlobalKey<FormState>();
  final _formKeyExercise = GlobalKey<FormState>();

  //TEXTOS QUE O USUARIO VAI PREENCHER
  final TextEditingController _nomeTreino = TextEditingController();
  TextEditingController _nomeExercicio = TextEditingController();
  String? _series = "4";
  String? _repeticoes = "8-12";

  //LISTA DE WIDGETS LISTTILE COM OS EXERCICOS ADICIONADOS PELO USUARIO
  List<Widget> _listTile = [];

  //LISTA MAPEANDO OS VALORES ADICIONADOS PELO USUARIO
  List<Map<String, String>> _listaExercicios = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: null,
          ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Coloque um nome ao seu novo treino",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              TextFormField(
                controller: _nomeTreino,
                decoration: InputDecoration(
                    labelText: 'Nome do treino',
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Insira um nome ao seu treino";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Adicione um Exercício Abaixo',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKeyExercise,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nomeExercicio,
                      decoration: InputDecoration(
                        labelText: 'Nome do exercício',
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Insira um nome para o exercício";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          labelText: "Número de Séries",
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5))),
                      value: _series,
                      items: <String>[
                        "1",
                        "2",
                        "3",
                        "4",
                        "5",
                        "6",
                        "7",
                        "8",
                        "9",
                        "10"
                      ].map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _series = newValue;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          labelText: "Número de Repetições",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Colors.grey))),
                      value: _repeticoes,
                      items: <String>[
                        "1-4",
                        "5-7",
                        "8-12",
                        "13-15",
                        "no-repeats"
                      ].map((String value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _repeticoes = newValue;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKeyExercise.currentState!.validate()) {
                          _addItem();
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Adicionado com sucesso!")));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const Icon(Icons.check),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Exercícios Adicionados',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(children: _listTile),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFB8E0E),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Salvo com sucesso!")));
                    }
                  },
                  child: const Text("Salvar"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addItem() {
    setState(() {
      _listTile.add(
        Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          background: Container(
            margin: EdgeInsets.only(right: 15),
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete,
              size: 100,
            ),
          ),
          onDismissed: (DismissDirection direction) {
            setState(() {});
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _nomeExercicio.text,
                    style: const TextStyle(fontSize: 17),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Séries: $_series",
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Repetições: $_repeticoes",
                          style: const TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      _listaExercicios.add({
        "exercicio": _nomeExercicio.text,
        "series": "$_series",
        "repeticoes": "$_repeticoes"
      });
      print(_listaExercicios);
    });
  }
}
