import 'dart:io';

//import 'package:chewie/chewie.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
//import 'package:hosting_app/Model/video_view_model.dart';
//import 'package:video_player/video_player.dart';

//import '../../app_theme.dart';

class MessageVideo extends StatefulWidget {
  File video;
  MessageVideo(this.video);
  @override
  _MessageVideoState createState() => _MessageVideoState();
}

class _MessageVideoState extends State<MessageVideo> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  // Widget currentView;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.file(widget.video);
    await Future.wait([
      _videoPlayerController.initialize(),
    ]);
    _createChewieController();
    setState(() {});
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: _videoPlayerController.value.aspectRatio,
      autoPlay: false,
      looping: true,
      allowFullScreen: true,
      autoInitialize: true,
      allowMuting: true,
      allowedScreenSleep: true,
      showControlsOnInitialize: true,
      showOptions: false,

      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    /*double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;*/
    return Container(
      height: 250,
      color: Colors.black,
      child: _chewieController != null &&
              _chewieController.videoPlayerController.value.isInitialized
          ? Chewie(
              controller: _chewieController,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading'),
              ],
            ),
    );
  }
}
