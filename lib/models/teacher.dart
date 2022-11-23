class Teacher {
  final int ID;
  final String user_name;
  final String f_name;
  final String m_name;
  String? l_name;
  final String password;
  final String phone_number;

  Teacher(
      {required this.ID,
      required this.user_name,
      required this.f_name,
      required this.m_name,
      this.l_name,
      required this.password,
      required this.phone_number});

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
        ID: int.parse(json['ID']),
        user_name: json['user_name'],
        f_name: json['f_name'],
        m_name: json['m_name'],
        l_name: json['l_name'] ?? '',
        password: json['password'],
        phone_number: json['phone_number']);
  }
}
