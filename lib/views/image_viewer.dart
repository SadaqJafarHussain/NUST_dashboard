import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sizer/sizer.dart';

import '../widgets/loader.dart';



class PhotoViewer extends StatefulWidget {
  final String? imageAds;
  final String? url;
  const PhotoViewer({Key? key, @required this.imageAds,
    @required this.url,
  }) : super(key: key);
  @override
  _PhotoViewerState createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  bool finishLoading=false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.network(
                    widget.url!+widget.imageAds!,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null){
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            finishLoading=true;
                          });
                        });
                        return child;
                      }
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          finishLoading=false;
                        });
                      });
                      return Center(
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("...الرجاء الانتظار",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1C2833),
                              ),),
                              SizedBox(
                                height: 2.h,
                              ),
                             Loader(),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
          Positioned(
            left: 0.0,
            top: 0.0,
            child: Image.asset("images/uni.png",
              height: 6.h,
            ),
          ),
        ],
      ),
    );
  }
}
