import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 6.h,
                        width: 6.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 2.h,
                            width: 60.w,
                            color: Colors.grey,
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                          ),
                          SizedBox(height: 1.h,),
                          Container(
                            height: 2.h,
                            width: 50.w,
                            color: Colors.grey,
                            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    height: 4.h,
                    color: Colors.grey,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
               Expanded(
                 child: ListView.builder(
                     itemCount: 30,
                     itemBuilder: (context,index){
                   return  Column(
                     children: [
                       SizedBox(
                         height: 1.h,
                       ),
                       Shimmer.fromColors(
                         baseColor: Colors.grey,
                         highlightColor: Colors.white,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Container(
                               height: 2.h,
                               width: 20.w,
                               color: Colors.grey,
                               padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                             ),
                             Container(
                               height: 2.h,
                               width: 20.w,
                               color: Colors.grey,
                               padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                             ),
                             Container(
                               height: 2.h,
                               width: 20.w,
                               color: Colors.grey,
                               padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                             ),
                             Container(
                               height: 2.h,
                               width: 20.w,
                               color: Colors.grey,
                               padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                             ),
                             Container(
                               height: 2.h,
                               width: 20.w,
                               color: Colors.grey,
                               padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 15),
                             ),
                           ],
                         ),
                       ),
                       SizedBox(
                         height: 1.h,
                       ),
                     ],
                   );
                 }),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
