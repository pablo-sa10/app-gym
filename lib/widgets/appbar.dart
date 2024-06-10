import 'package:flutter/material.dart';

class AppBarBuild extends StatelessWidget implements PreferredSizeWidget{
  const AppBarBuild({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Academia"),
      centerTitle: true,
      backgroundColor: Colors.amber,
    );
  }
}

