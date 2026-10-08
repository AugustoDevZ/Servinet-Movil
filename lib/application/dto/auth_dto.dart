class AuthDto {
  final String? usermail;
  final String? username;
  final String password;

  AuthDto({
    required this.username,
    required this.password,
    required this.usermail,
  });

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password, 'usermail': usermail};
  }
}
