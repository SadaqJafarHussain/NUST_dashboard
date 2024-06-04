import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/loader.dart';

class VideoScreen extends StatefulWidget {
  final String? video;
  final String? url;

  VideoScreen({@required this.video, @required this.url});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final FijkPlayer player = FijkPlayer();

  _VideoScreenState();

  @override
  void initState() {
    super.initState();
    player.setDataSource(['${widget.url}${widget.video}'][0], autoPlay: true,);
    player.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    player.setLoop(100);
    player.setVolume(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child:  Stack(
              children: [
                AspectRatio(
                  aspectRatio:player.value.size!.aspectRatio,
                  child: FijkView(
                    player: player,
                  ),
                ),
                Positioned(
                  left: 0.0,
                  top: 0.0,
                  child: Image.asset(
                    "images/uni.png",
                    height: 6.h,
                  ),
                ),
              ],
            )
    ));
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }
}
