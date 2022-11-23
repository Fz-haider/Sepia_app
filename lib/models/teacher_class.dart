class TeacherClass {
  final int ID;
  final int class_id;
  final int grade;
  final String? label;
  final String subject;

  TeacherClass(
      {required this.ID,
      required this.grade,
      required this.class_id,
      this.label,
      required this.subject});

  factory TeacherClass.fromJson(Map<String, dynamic> json) {
    return TeacherClass(
      ID: int.parse(json['ID']),
      class_id: int.parse(json['class_id']),
      grade: int.parse(json['grade']),
      label: json['label'] ?? '',
      subject: json['s_name'],
    );
  }
}
