class Diaries {
  String? memberId;
  String? diaryId;
  final String? writeDate;
  final String? content;

  Diaries({
    this.memberId,
    this.diaryId,
    required this.writeDate,
    required this.content,
  });

  factory Diaries.fromJson(Map<String, dynamic> json) {
    return Diaries(
      memberId: json['memberId'],
      diaryId: json['diaryId'],
      writeDate: json['writeDate'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toJson() => {
        'memberId': memberId,
        'diaryId': diaryId,
        'writeDate': writeDate,
        'content': content,
      };
}
