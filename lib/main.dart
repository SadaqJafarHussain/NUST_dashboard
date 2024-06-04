import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:auto_start_flutter/auto_start_flutter.dart';
import 'Providers/app_provider.dart';
import 'home_page.dart';


void main() async{
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AppProvider(),
      ),
    ],
    child: RestartWidget(
        child: MyApp()
    ),
  ),

  );
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class RestartWidget extends StatefulWidget {
  RestartWidget({@required this.child});

  final Widget? child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()!.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {

  @override
  void initState() {
    super.initState();
    //call in init state;
    initAutoStart();
  }

  Future<void> initAutoStart() async {
    try {
      //check auto-start availability.
      var test = await (isAutoStartAvailable);
      print(test);
      //if available then navigate to auto-start setting page.
      if (test!) await getAutoStartPermission();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return;
  }

  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(microseconds: 1)).then((value) async{
      WidgetsFlutterBinding.ensureInitialized();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (orientation,constraints,deviceType){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:  MyHomePage(),
        );
      },
    );
  }
}


