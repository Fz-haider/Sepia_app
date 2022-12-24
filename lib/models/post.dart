class Post {
  final int ID;
  final int teacher_id;
  final String teacher_f_name;
  final String teacher_m_name;
  final String? teacher_l_name;
  final String? teacher_picture;
  final int class_id;
  final String subject;
  final String title;
  final String? p_body;
  final String? p_background_path;

  Post(
      {required this.ID,
      required this.teacher_id,
      required this.teacher_f_name,
      required this.teacher_m_name,
      this.teacher_l_name,
      this.teacher_picture,
      required this.class_id,
      required this.subject,
      required this.title,
      this.p_body,
      this.p_background_path});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        ID: int.parse(json['ID']),
        teacher_id: int.parse(json['teacher_id']),
        teacher_f_name: json['teacher_f_name'],
        teacher_m_name: json['teacher_m_name'],
        teacher_l_name: json['teacher_l_name'] ?? '',
        teacher_picture: json['teacher_picture'],
        class_id: int.parse(json['class_id']),
        subject: json['subject'],
        title: json['title'],
        p_body: json['p_body'] ?? '',
        p_background_path: json['p_background_path'] ?? '');
  }
}
