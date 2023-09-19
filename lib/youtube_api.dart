import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/video_list.dart'; 

const chaveYoutubeApi = "AIzaSyBywYyy58uwVOKM0tn25SsWwEOBLuduTDw";
const idCanal = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const urlBase = "https://www.googleapis.com/youtube/v3/";

class Api {
  
  Future<List<Video>?> pesquisar (String pesquisa) async {

    http.Response response = await http.get(Uri.parse(
        "${urlBase}search"
        "?part=snippet"
        "&type=video"
        "&maxResults=20"
        "&order=date"
        "&key=$chaveYoutubeApi"
        "&channelId=$idCanal"
        "&q=$pesquisa"
      ));

      if(response.statusCode == 200){

        Map<String, dynamic> dadosJson = json.decode(response.body);

        List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
            //return Video.converterJson(map);
          }
        ).toList();

        return videos;

        /*
        for (var video in dadosJson["items"]){
          debugPrint("Resultado: ${video.toString()}");
        }
        */

        //debugPrint("Resultado: ${dadosJson["items"][0]["snippet"]["title"].toString()}");

      } else {

      }

  }

}