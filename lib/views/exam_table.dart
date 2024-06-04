import 'dart:async';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intel;
import '../models/exam_model.dart';

class ExamTable extends StatefulWidget {
  const ExamTable({Key? key, @required this.table}) : super(key: key);
  final List<ExamModel>? table;
  @override
  _ExamTableState createState() => _ExamTableState();
}

class _ExamTableState extends State<ExamTable> {
  bool isLast = false;
  Timer? timer1;
  Timer? timer2;
  List<ExamModel>? myTable;
  var i=0;

  String? _timeString;
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void initState() {
    getSubTable();
    _timeString = _formatDateTime(DateTime.now());
    timer1 =
        Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
    timer2 = Timer.periodic(const Duration(seconds: 30), (Timer t) => getSubTable());
    super.initState();
  }

  @override
  void dispose() {
    timer1?.cancel();
    timer2?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1C2833),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.yellow.shade200,
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "     ${widget.table![0].title}",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.w900,
                        color: Colors.red,
                        fontSize: 10.sp,
                      ),
                    ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Image.asset(
                         "images/uni.png",
                         height: 6.h,
                       ),
                       Column(
                         textDirection: TextDirection.rtl,
                         children: [
                           Text(
                             "$_timeString ${intel.DateFormat(' a').format(DateTime.now())}",
                             style: TextStyle(
                               fontFamily: "Cairo",
                               fontWeight: FontWeight.bold,
                               fontSize: 6.sp,
                               color: Color(0xff1c294b),
                             ),
                           ),
                           Text(
                             DateTime.now()
                                 .toString()
                                 .replaceAll("-", "/")
                                 .substring(0, 10),
                             style: TextStyle(
                               fontFamily: "Cairo",
                               fontWeight: FontWeight.bold,
                               fontSize: 6.sp,
                               color: Color(0xff1c294b),
                             ),
                           ),
                           Text(
                             "${intel.DateFormat("EEEE").format(DateTime.now())}",
                             style: TextStyle(
                               fontFamily: "Cairo",
                               fontWeight: FontWeight.bold,
                               fontSize: 7.sp,
                               color: Color(0xff1c294b),
                             ),
                           ),
                         ],
                       ),
                     ],
                   )
                  ],
                ),
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "القاعة",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 8.sp,
                            color: Color(0xff1c294b),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "الكلية ",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 8.sp,
                            color: Color(0xff1c294b),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          " المرحلة",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 8.sp,
                            color: Color(0xff1c294b),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "المادة",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 8.sp,
                            color: Color(0xff1c294b),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "اليوم/التاريخ",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            color: Color(0xff1c294b),
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Center(
                        child: Text(
                          "التسلسل من / الى",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            color: Color(0xff1c294b),
                            fontSize: 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    color: Color(0xff1C2833),
                    child: ListView.builder(
                        itemCount: myTable!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 4.h,
                            alignment: Alignment.center,
                            decoration:BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            margin: EdgeInsets.all(1.0),
                            child: Row(
                              textDirection: TextDirection.rtl,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      widget.table![index].holeName ?? "---",
                                      style: TextStyle(
                                        fontFamily: "Cairo",
                                        fontSize: 8.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      widget.table![index].collegeName ?? "---",
                                      style: TextStyle(
                                        fontFamily: "Cairo",
                                        fontSize: 8.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      widget.table![index].stageName ?? "---",
                                      style: TextStyle(
                                        fontFamily: "Cairo",
                                        fontSize: 8.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Text(
                                      widget.table![index].materialName ?? "---",
                                      style: TextStyle(
                                        fontFamily: "Cairo",
                                        fontSize: 8.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Center(
                                      child: Text(
                                        "${widget.table![index].date ?? "0"} / ${widget.table![index].dayName ?? "0"}",
                                        style: TextStyle(
                                          fontFamily: "Cairo",
                                          color: Colors.white,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    child: Center(
                                      child: Text(
                                        "${widget.table![index].seqTo ?? "0"} / ${widget.table![index].seqFrom ?? "0"}",
                                        style: TextStyle(
                                          fontFamily: "Cairo",
                                          color: Colors.white,
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }


  getSubTable(){
    if(i<=widget.table!.length&&widget.table!.length>=i+10){
      print('hi 1');
      myTable=widget.table!.getRange(i, i+10).toList();
      setState(() {i=i+10;});
    }else {
      print('hi 2');
      myTable=widget.table!.getRange(i, widget.table!.length).toList();
      setState(() {i=0;});
    }
  }

  String _formatDateTime(DateTime dateTime) {
    return intel.DateFormat(' hh : mm : ss').format(dateTime);
  }
}
