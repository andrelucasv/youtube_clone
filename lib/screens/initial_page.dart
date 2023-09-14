import 'package:flutter/material.dart';

import '../youtube_api.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {

    Api api = Api();
    api.pesquisar("");

    return const Center(
      child: Text(
        "Início",
        style: TextStyle(
          fontSize: 25
        ),
      )
    );
  }
}