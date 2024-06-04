import 'package:flutter/material.dart';

import '../main.dart';

class ServerDown extends StatefulWidget {
  const ServerDown({Key? key}) : super(key: key);

  @override
  _ServerDownState createState() => _ServerDownState();
}

class _ServerDownState extends State<ServerDown> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) {
      RestartWidget.restartApp(context);
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration:const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/system.png"),
                    )
                ),
              ),
            ),
            const Text("الخادم غير متوفر ",
              style: TextStyle(fontSize: 40,
                  color: Colors.red,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold),),
            const  Padding(
              padding:  EdgeInsets.all(15),
              child: Text("الخدمة متوقفه لاسباب مجهوله , قم بالتواصل مع مطور البرنامج ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,
                  fontFamily: "Cairo"
                ),),
            ),
          ],
        ));
  }
}
