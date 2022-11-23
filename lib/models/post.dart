class Post {
  final int ID;
  final int t_id;
  final String title;
  final String? p_body;
  final String? p_background_path;

  Post(
      {required this.ID,
      required this.t_id,
      required this.title,
      this.p_body,
      this.p_background_path});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        ID: int.parse(json['ID']),
        t_id: int.parse(json['t_id']),
        title: json['title'],
        p_body: json['p_body'] ?? '',
        p_background_path: json['p_background_path'] ?? '');
  }
}
