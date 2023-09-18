import 'package:flutter/material.dart';
import 'package:youtube_clone/custom_search.dart';
import 'package:youtube_clone/screens/initial_page.dart';
import 'package:youtube_clone/screens/library_page.dart';
import 'package:youtube_clone/screens/subscriptions_page.dart';
import 'package:youtube_clone/screens/trending_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(_resultado),
      const EmAlta(),
      const Inscricao(),
      const Biblioteca()
    ];

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
            onPressed: () async {
              String? res = await showSearch(context: context, delegate: CustomSearchDelegate());
              setState(() {
                _resultado = res!;
              });
              debugPrint("Resultado: digitado $res");
            }, 
            icon: const Icon(Icons.search)
          ),

          /*
          IconButton(
            onPressed: () {
              debugPrint("Ação: Videocam");
            }, 
            icon: const Icon(Icons.videocam)
          ),
          
          IconButton(
            onPressed: () {
              debugPrint("Ação: Conta");
            }, 
            icon: const Icon(Icons.account_circle)
          )
          */

        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
          items: const [
            BottomNavigationBarItem(
              label: "Início",
              icon: Icon(Icons.home)
            ),
            BottomNavigationBarItem(
              label: "Em alta",
              icon: Icon(Icons.whatshot)
            ),
            BottomNavigationBarItem(
              label: "Inscrições",
              icon: Icon(Icons.subscriptions)
            ),
            BottomNavigationBarItem(
              label: "Biblioteca",
              icon: Icon(Icons.folder)
            ),
        ],
      ),
    );
  }
}