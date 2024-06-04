
import 'package:flutter/material.dart';
import 'dart:math';

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin {

  double initialRadius=80;
  double radius=0.0;

  AnimationController? controller;
  Animation<double>? rotation;
  Animation<double>? comes_in;
  Animation<double>? comes_out;

  @override
  void initState() {
    super.initState();

    controller=AnimationController(vsync: this,duration: Duration(seconds: 2));
    rotation=Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: controller!,
        curve: Interval(0.0,1.0, curve: Curves.linear
        )));
    comes_in=Tween(begin: 1.0,end: 0.0).animate(CurvedAnimation(parent: controller!,
        curve: Interval(0.75,1.0, curve: Curves.elasticIn
    )));
   comes_out= Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: controller!,
        curve: Interval(0.0,0.25, curve: Curves.elasticOut
        )));

   controller!.addListener(() {
     setState(() {
       if(controller!.value>=0.75&&controller!.value<=1.0){
         radius=comes_in!.value*initialRadius;
       }else if(controller!.value>=0.0&&controller!.value<=0.25){
         radius=comes_out!.value*initialRadius;
       }
     });

   });
   controller!.repeat();
  }
   @override
  void dispose() {
    controller!.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 200,
      width: 200,
          child: RotationTransition(
            turns: rotation!,
            child: Stack(
              children: [
                Dot(
                  radius: 60,
                  color: Color(0xffd7b807),
                ),
                Transform.translate(
                  offset: Offset(radius*cos(pi/4),radius*sin(pi/4)),
                  child: Dot(
                    radius: 20,
                    color: Colors.red,
                  ),
                ),
                Transform.translate(
                  offset: Offset(radius*cos(2*pi/4),radius*sin(2*pi/4)),
                  child: Dot(
                    radius: 20,
                    color: Colors.blueAccent,
                  ),
                ),
                Transform.translate(
                  offset: Offset(radius*cos(3*pi/4),radius*sin(3*pi/4)),
                  child: Dot(
                    radius: 20,
                    color: Colors.green,
                  ),
                ),
                Transform.translate(
                  offset: Offset(radius*cos(4*pi/4),radius*sin(4*pi/4)),
                  child: Dot(
                    radius: 20,
                    color: Colors.purple,
                  ),
                ),
                Transform.translate(
                  offset: Offset(radius*cos(5*pi/4),radius*sin(5*pi/4)),
                  child: Dot(
                    radius: 20,
                    color: Colors.pink,
                  ),
                ),
                Transform.translate(
                  offset: Offset(radius*cos(6*pi/4),radius*sin(6*pi/4)),
                  child: Dot(
                    radius: 20,
                    color: Colors.indigo,
                  ),
                ),
                Transform.translate(
                  offset: Offset(radius*cos(7*pi/4),radius*sin(7*pi/4)),
                  child: Dot(
                    radius: 20,
                    color: Colors.cyan,
                  ),
                ),
                Transform.translate(
                  offset: Offset(radius*cos(8*pi/4),radius*sin(8*pi/4)),
                  child: Dot(
                    radius: 20,
                    color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
    ));
  }
}

class Dot extends StatelessWidget {
  final double? radius;
  final Color? color;
  Dot({@required this.color,@required this.radius});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}

