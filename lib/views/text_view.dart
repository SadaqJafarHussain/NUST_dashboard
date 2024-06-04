import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextView extends StatelessWidget {
  final String? text;
  TextView({@required this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/uni.png"),
              fit: BoxFit.contain),
            ),
            child: Center(
              child: Opacity(
                opacity: 0.9,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text("اعلان",
                      style: TextStyle(color: Colors.red,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.w900,
                      fontSize: 20.sp,),
                      textAlign: TextAlign.center,),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.h,),
                        child: Text(text!,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color(0xff17202A),
                            fontFamily: "Cairo",
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
