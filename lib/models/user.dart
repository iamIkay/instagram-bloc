class User {
  final String name;
  final String avi;

  const User({required this.name, required this.avi});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      avi: json['avi'],
    );
  }
}
