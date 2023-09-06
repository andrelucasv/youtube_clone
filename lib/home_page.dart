import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("Ação: Videocam");
            }, 
            icon: const Icon(Icons.videocam)
          ),
          IconButton(
            onPressed: () {
              debugPrint("Ação: Pesquisa");
            }, 
            icon: const Icon(Icons.search)
          ),
          IconButton(
            onPressed: () {
              debugPrint("Ação: Conta");
            }, 
            icon: const Icon(Icons.account_circle)
          )
        ],
      ),
      body: Container(),
    );
  }
}