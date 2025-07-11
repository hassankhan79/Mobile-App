class SubjectDetail{
  final String? uid;
  final String sub_name;
  final String sub_teacher;
  final cridetHours;
  final String mid_marks;
  final String Final_marks;


  SubjectDetail({
    this.uid,
    required this.sub_name,
    required this.sub_teacher,
    required this.cridetHours,
    required this.mid_marks,
    required this.Final_marks

});
  Map<String, dynamic> toJson(){
    return{
      "uid" : uid,
      "sub_name" : sub_name,
      "sub_teacher" : sub_teacher,
      "creditHours" : cridetHours,
      "mid_marks" : mid_marks,
      "Final_marks" : Final_marks
    };
  }
  factory SubjectDetail.fromJason(Map<String, dynamic> json){
    return SubjectDetail (
      sub_name: json['sub_name']?? '',
      sub_teacher: json['sub_teacher'] ?? '',
      cridetHours: json['cridetHours'] ?? '',
      mid_marks: json['mid_marks'] ?? '',
      Final_marks: json['Final_marks']?? ''
    );
  }
}