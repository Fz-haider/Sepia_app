class Post {
  final int ID;
  final int teacher_id;
  final int class_id;
  final String title;
  final String? p_body;
  final String? p_background_path;

  Post(
      {required this.ID,
      required this.teacher_id,
      required this.class_id,
      required this.title,
      this.p_body,
      this.p_background_path});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        ID: int.parse(json['ID']),
        teacher_id: int.parse(json['teacher_id']),
        class_id: int.parse(json['class_id']),
        title: json['title'],
        p_body: json['p_body'] ?? '',
        p_background_path: json['p_background_path'] ?? '');
  }
}
