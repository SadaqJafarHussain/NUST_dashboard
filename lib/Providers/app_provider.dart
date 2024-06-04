import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart' as intel;
import '../models/add_modal.dart';
String local='http://192.168.10.130:80';
String cloud='https://wakel.info';
class AppProvider extends ChangeNotifier{
  String? statusData;
 final String baseUrl=local;
bool isThereError=false;
  Future getTable(int number)async{
   try {
     String url=baseUrl+'/collage/api/daily/read.php';
     final response=number==0?await http.get(Uri.parse(url+"?day_name=${intel.DateFormat("EEEE").format(DateTime.now()).substring(0,3)}"))
         :await http.get(Uri.parse(url));
     print("this is your table ${response.body}");
     var decoded= jsonDecode(response.body);
     return decoded;
   }catch(e){
     print(e);
     isThereError=true;
     notifyListeners();
   }
  }
  Stream<Map> tableStream(int number) async* {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      Map someTable =await getTable(number);
      yield someTable;
    }
  }
Future getStatus() async{
 try{
   final response=await http.get(Uri.parse(baseUrl+"/collage/api/daily/check_status.php"));
   var decoded= jsonDecode(response.body);
   return decoded;
 }catch(e){
   print(e);
   isThereError=true;
   notifyListeners();
 }
}
Stream<String> statusStream() async* {
  while (true) {
    await Future.delayed(const Duration(milliseconds: 50));
    Map status =await getStatus();
    yield status["status"].toString().trim();
  }
}
 Future getAdds()async{
 try {
   final response=await http.get(Uri.parse(baseUrl+"/collage/api/ads/check_ads.php"));
   var decoded= json.decode(response.body);
   Map adds=decoded;
   Ads  _ads = Ads.fromJson(adds,decoded["url_file"]??"no");
   // print(_ads.url+''+_ads.video+'  ');
   return _ads;
 }catch(e){
   print(e);
   isThereError=true;
   notifyListeners();
 }
}
Stream<Ads> AdsStream() async* {
  while (true) {
    await Future.delayed(const Duration(milliseconds: 50));
    Ads someAds =await getAdds();
    yield someAds;
  }
}
}