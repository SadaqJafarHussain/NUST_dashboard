import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';
class MyTvScreen extends StatefulWidget {
   final String? url;
   final String? video;
  MyTvScreen({Key? key,@required this.url,@required this.video})
      : super(key: key);
  @override
  _MyTvScreenState createState() => _MyTvScreenState();
}
class _MyTvScreenState extends State<MyTvScreen>{
  late VideoPlayerController _controller;


  @override
  void initState() {
    _controller = VideoPlayerController.networkUrl(Uri.parse("${widget.url}${widget.video}"));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(child: VideoPlayer(_controller),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,),
            Positioned(
              left: 0.0,
              top: 0.0,
              child: Image.asset(
                "images/uni.png",
                height: 6.h,
              ),
            ),
          //  VideoProgressIndicator(_controller, allowScrubbing: true),
          ],
        ),
      ),

    );
  }

}