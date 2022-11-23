class TeacherClass {
  final int ID;
  final int grade;
  final String? label;
  final String subject;

  TeacherClass(
      {required this.ID,
      required this.grade,
      this.label,
      required this.subject});

  factory TeacherClass.fromJson(Map<String, dynamic> json) {
    return TeacherClass(
      ID: int.parse(json['ID']),
      grade: int.parse(json['grade']),
      label: json['label'] ?? '',
      subject: json['s_name'],
    );
  }
}
