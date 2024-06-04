class ExamModel {
  String holeName;
  String materialName;
  String collegeName;
  String stageName;
  String dayName;
  String seqFrom;
  String seqTo;
  String title;
  String date;
  ExamModel({
    this.date='',
    this.collegeName='',
    this.dayName='',
    this.holeName='',
    this.materialName='',
    this.seqFrom='',
    this.seqTo='',
    this.stageName='',
    this.title=''
  });

  factory ExamModel.fromJson (Map <dynamic,dynamic> json,String title)=>ExamModel(
 holeName:json["hole_name"].toString(),
 collegeName:json["univers_name"].toString(),
  materialName:json["material_name"].toString(),
  stageName:json["stage_name"].toString(),
  dayName:json["day_name"].toString(),
  seqFrom:json["sequence_from"].toString(),
  seqTo:json["sequence_to"].toString(),
  title:title,
  date:json["exam_date"].toString(),
  );
}