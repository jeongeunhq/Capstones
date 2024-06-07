class MonthlyEmotion {
  final String month;
  final String joy;
  final String hope;
  final String neutrality;
  final String sadness;
  final String anger;
  final String anxiety;
  final String tiredness;
  final String regret;

  MonthlyEmotion({
    required this.month,
    required this.joy,
    required this.hope,
    required this.neutrality,
    required this.sadness,
    required this.anger,
    required this.anxiety,
    required this.tiredness,
    required this.regret,
  });

  factory MonthlyEmotion.fromJson(Map<String, dynamic> json) {
    return MonthlyEmotion(
      month: json['MONTH'],
      joy: json['JOY'],
      hope: json['HOPE'],
      neutrality: json['NEUTRALITY'],
      sadness: json['SADNESS'],
      anger: json['ANGER'],
      anxiety: json['ANXIETY'],
      tiredness: json['TIREDNESS'],
      regret: json['REGRET'],
    );
  }
}

class Top3Emotions {
  final String emotionType;
  final int count;

  Top3Emotions({
    required this.emotionType,
    required this.count,
  });

  factory Top3Emotions.fromJson(Map<String, dynamic> json) {
    return Top3Emotions(
      emotionType: json['EMOTION_TYPE'],
      count: json['COUNT'],
    );
  }
}

class HourlyEmotion {
  final String emotionType;
  final int emotionTime;
  final int count;

  HourlyEmotion({
    required this.emotionType,
    required this.emotionTime,
    required this.count,
  });

  factory HourlyEmotion.fromJson(Map<String, dynamic> json) {
    return HourlyEmotion(
      emotionType: json['emotionType'],
      emotionTime: json['emotionTime'],
      count: json['count'],
    );
  }
}
