import 'package:flutter/material.dart';
import 'package:youtube_clone/model/video_list.dart';
import 'package:youtube_clone/screens/video_page.dart';

import '../youtube_api.dart';

class Inicio extends StatefulWidget {

  final String pesquisa;

  const Inicio(this.pesquisa, {super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {

    listarVideos(String pesquisa){

      Api api = Api();
      return api.pesquisar(pesquisa);

    }

    return FutureBuilder<List<Video>?>(
      future: listarVideos(widget.pesquisa),
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none :
          case ConnectionState.waiting :
            return const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active :
          case ConnectionState.done :
            if(snapshot.hasData){

              return ListView.separated(
                itemBuilder: (context, index){

                  List<Video> videos = snapshot.data!;
                  Video video = videos[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPage(video: video)));
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(video.imagem!)
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo!),
                          subtitle: Text(video.canal!),
                        )
                      ],
                    ),
                  );

                }, 
                separatorBuilder: (context, index) => const Divider(
                  height: 2,
                  color: Colors.grey,
                ), 
                itemCount: snapshot.data!.length
              );

            } else {
              return const Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
            break;
        }
      },
    );
  }
}