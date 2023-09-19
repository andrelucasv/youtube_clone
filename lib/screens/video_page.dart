import 'package:flutter/material.dart';
import 'package:youtube_clone/model/video_list.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPage extends StatefulWidget {
  Video video;
  VideoPage({super.key, required this.video});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {

  dynamic controller;

  @override
  void initState() {
    controller = YoutubePlayerController.fromVideoId(
      videoId: widget.video.id!,
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
    super.initState();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: controller,
        aspectRatio: 16 / 9,
      ),
    );
  }
}