class User
{
  String? userId;
  late String name;
  late String username;
  late String email;
  late String password;
  int? cheffHatsReceived;

  User(
    this.name,
    this.username,
    this.email,
    this.password
  );

  User.fromJson(Map<String, dynamic> json):
        userId = json['userId'],
        username = json['username'],
        cheffHatsReceived = json['cheffHatsReceived'];

  Map<String, dynamic> toJson() => {
    'name': name,
    'username': username,
    'email': email,
    'password': password
  };
}