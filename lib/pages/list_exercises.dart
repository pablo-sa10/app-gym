import 'package:flutter/material.dart';

class ListExercises extends StatefulWidget {
  final int exercise;

  const ListExercises({super.key, required this.exercise});

  @override
  State<ListExercises> createState() => _ListExercisesState();
}

class _ListExercisesState extends State<ListExercises> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: InkWell(
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            final result = await _dialog(context);
            if(result){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Treino excluído com sucesso"),));
            }
            return result;
          },
          background: Container(
            margin: EdgeInsets.only(right: 15),
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: const Icon(
              Icons.delete,
              size: 70,
            ),
          ),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    "assets/images/img${widget.exercise}.png",
                    scale: 0.9,
                    fit: BoxFit.cover,
                  ),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("TITULO DE BATATA"),
                        Text("DURAÇÃO MEDIA: 40 min"),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () {},
        onLongPress: () {},
      ),
    );
  }

  Future<bool> _dialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Você tem certeza que deseja excluir esse item?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text("Sim"),
              ),
            ],
          );
        });
  }
}
