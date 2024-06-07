class LogIn {
  final String? loginId;
  final String? password;

  LogIn({
    required this.loginId,
    required this.password,
  });

  factory LogIn.fromJson(Map<String, dynamic> json) {
    return LogIn(
      loginId: json['loginId'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'loginId': loginId,
        'password': password,
      };
}