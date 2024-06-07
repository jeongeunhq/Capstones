class Diaries {
  int diaryId;
  String memberId;
  final String writeDate;
  final String content;
  String emotionType;

  Diaries({
    required this.diaryId,
    required this.memberId,
    required this.writeDate,
    required this.content,
    required this.emotionType,
  });

  factory Diaries.fromJson(Map<String, dynamic> json) {
    return Diaries(
      diaryId: json['diaryId'],
      memberId: json['memberId'],
      writeDate: json['writeDate'],
      content: json['content'],
      emotionType: json['emotionType'],
    );
  }

  Map<String, dynamic> toJson() => {
        'diaryId': diaryId,
        'memberId': memberId,
        'writeDate': writeDate,
        'content': content,
        'emotionType': emotionType,
      };
}