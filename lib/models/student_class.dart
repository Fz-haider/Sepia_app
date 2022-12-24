class StudentClass {
  final int ID;
  final int class_id;
  final int teacher_id;
  final String teacher_f_name;
  final String teacher_m_name;
  final String? teacher_l_name;
  final String? teacher_picture;
  final String subject;

  StudentClass(
      {required this.ID,
      required this.teacher_id,
      required this.class_id,
      required this.teacher_f_name,
      required this.teacher_m_name,
      this.teacher_l_name,
      this.teacher_picture,
      required this.subject});

  factory StudentClass.fromJson(Map<String, dynamic> json) {
    return StudentClass(
      ID: int.parse(json['ID']),
      class_id: int.parse(json['class_id']),
      teacher_id: int.parse(json['teacher_id']),
      teacher_f_name: json['teacher_f_name'],
      teacher_m_name: json['teacher_m_name'],
      teacher_l_name: json['teacher_l_name'] ?? '',
      teacher_picture: json['teacher_picture'],
      subject: json['subject'],
    );
  }
}
