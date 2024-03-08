class Member {
  final String? memberId;
  final String? password;
  final String? nickname;
  final String? gender;
  final String? birthDate;

  Member({
    required this.memberId,
    required this.password,
    required this.nickname,
    required this.gender,
    required this.birthDate,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      memberId: json['memberId'],
      password: json['password'],
      nickname: json['nickname'],
      gender: json['gender'],
      birthDate: json['birthDate'],
    );
  }

  Map<String, dynamic> toJson() => {
        'memberId': memberId,
        'password': password,
        'nickname': nickname,
        'gender': gender,
        'birthDate': birthDate,
      };
}
