class Student {
  final int ID;
  final String user_name;
  final String? picture;
  final String f_name;
  final String m_name;
  final String? l_name;
  final String password;
  final String phone_number;
  final String? address;
  final int class_id;

  Student(
      {required this.ID,
      required this.user_name,
      this.picture,
      required this.f_name,
      required this.m_name,
      this.l_name,
      required this.password,
      required this.phone_number,
      this.address,
      required this.class_id});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        ID: int.parse(json['ID']),
        user_name: json['user_name'],
        picture: json['picture'],
        f_name: json['f_name'],
        m_name: json['m_name'],
        l_name: json['l_name'] ?? '',
        password: json['password'],
        phone_number: json['phone_number'],
        address: json['address'],
        class_id: int.parse(json['class_id']));
  }
}
