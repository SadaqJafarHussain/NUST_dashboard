
class ClassTable {
  String holeName;
  String materialName;
  String collegeName;
  String stageName;
  String dayName;
  String timeFrom;
  String timeTo;

  ClassTable({
    this.collegeName = '',
    this.dayName = '',
    this.holeName = '',
    this.materialName = '',
    this.stageName = '',
    this.timeFrom = '',
    this.timeTo = '',
  });

  factory ClassTable.fromJson(Map<dynamic, dynamic> json) => ClassTable(
        holeName: json["hole_name"].toString(),
        collegeName: json["univers_name"].toString(),
        materialName: json["material_name"].toString(),
        stageName: json["stage_name"].toString(),
        dayName: json["day_name"].toString(),
        timeFrom: json["daily_time_from"].toString(),
        timeTo: json["daily_time_to"].toString(),
      );
}
