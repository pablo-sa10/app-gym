import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:fitness/controller/treino_controller.dart';

class TreinoForm extends StatefulWidget {
  const TreinoForm({super.key});

  @override
  State<TreinoForm> createState() => _TreinoFormState();
}

class _TreinoFormState extends State<TreinoForm> {
  final Treinocontroller treinocontroller = Treinocontroller();
  String _imagemSelecionada = 'assets/images/img1.png';

  //Lista de imagens em assets
  final List<String> _image = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png'
  ];

  //CHAVES PARA VALIDAÇÃO DE FORM
  final _formKey = GlobalKey<FormState>();
  final _formKeyExercise = GlobalKey<FormState>();

  //ID UNICO PARA O EXERCICIO
  final Uuid _uuid = const Uuid();

  //TEXTOS QUE O USUARIO VAI PREENCHER
  final TextEditingController _nomeTreino = TextEditingController();
  final TextEditingController _nomeExercicio = TextEditingController();
  String? _series = "4";
  String? _repeticoes = "8-12";

  //LISTA MAPEANDO OS VALORES ADICIONADOS PELO USUARIO
  final List<Map<String, dynamic>> _listaExercicios = [];

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
                  Padding(
                    padding: EdgeInsets.only(bottom: 15.0),
                    child: Text(
                      "Coloque um nome ao seu novo treino",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
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
                    "Adicione uma imagem",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Column(
                children: [
                  Image.asset(_imagemSelecionada),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _addImagem();
                    },
                    child: Icon(Icons.camera_alt_outlined),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo
                    ),
                  ),
                ],
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
              Column(
                children: _listaExercicios.map((exercise) {
                  return Dismissible(
                    key: Key(exercise['id']),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      margin: const EdgeInsets.only(right: 15),
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.delete,
                        size: 70,
                      ),
                    ),
                    onDismissed: (DismissDirection direction) {
                      _removeItem(exercise["id"]);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exercise["exercicio"],
                              style: const TextStyle(fontSize: 17),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Séries: ${exercise["series"]}",
                                    style: const TextStyle(fontSize: 17),
                                    textAlign: TextAlign.center,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "Repetições: ${exercise["repeticoes"]}",
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFB8E0E),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                      //Salva o Treino no banco
                      _addTreino();
                      //_addExercicios();
                      //Salva os Exercicios no banco

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
      _listaExercicios.add({
        "id": _uuid.v4(),
        "exercicio": _nomeExercicio.text,
        "series": "$_series",
        "repeticoes": "$_repeticoes"
      });
      _nomeExercicio.clear();
      _series = "4";
      _repeticoes = "8-12";
      print(_listaExercicios);
    });
  }

  _removeItem(String id) {
    setState(() {
      _listaExercicios.removeWhere((item) => item['id'] == id);
    });
  }

  void _addImagem() async{
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Escolha uma Imagem"),
        content: SingleChildScrollView(
          child: Column(
            children: _image.map((imagePath){
              return GestureDetector(
                onTap: (){
                  setState(() {
                      _imagemSelecionada = imagePath;
                  });
                  Navigator.of(context).pop();
                },
                child: Image.asset(imagePath, height: 100, width: 100),
              );
            }).toList()
          ),
        ),
      );
    });
  }

  void _addTreino() async {
    String nome = _nomeTreino.text;
    String imagem = _imagemSelecionada;
    await treinocontroller.addTreino(nome, imagem);
    setState(() {
      Navigator.of(context).pop();
    });
  }
}
