
class Member{
  final String? memberId;
  final String? password;
  final String? nickname;
  final String? gender;
  final String? birthdate;

  Member({
    this.memberId,
    this.password,
    this.nickname,
    this.gender,
    this.birthdate,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      memberId: json['memberId'],
      password: json['password'],
      nickname: json['nickname'],
      gender: json['gender'],
      birthdate: json['birthdate'],
    );
  }

  Map<String, dynamic> toJson() => {
        'memberId': memberId,
        'password': password,
        'nickname': nickname,
        'gender': gender,
        'birthdate': birthdate,
      };
}