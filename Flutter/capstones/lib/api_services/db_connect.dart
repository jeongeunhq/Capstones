// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:core';

import 'package:capstones/models/diary_model.dart';
import 'package:capstones/models/login_model.dart';
import 'package:capstones/models/member_model.dart';
import 'package:capstones/models/statistics_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

//회원가입 정보 전송
Future<bool> saveUser(Member member) async {
  try {
    final response = await http.post(
      Uri.parse("http://54.79.110.239:8080/api/members/add"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(member.toJson()),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      print("데이터가 성공적으로 전송되었습니다.");
      return true;
    } else {
      print("데이터 전송에 실패했습니다.");
      return false;
    }
  } catch (e) {
    print("Failed to send post data: $e");
    return false;
  }
}

//로그인정보 전송
Future<Member?> loginUser(String id, String password) async {
  const storage = FlutterSecureStorage(); // FlutterSecureStorage를 storage로 저장
  try {
    final loginData = LogIn(loginId: id, password: password);
    final response = await http.post(
      Uri.parse("http://54.79.110.239:8080/api/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(loginData.toJson()),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${utf8.decode(response.bodyBytes)}'); //인코딩 깨지는 부분 해결

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final Map<String, dynamic> userJson = responseData['user'];
      final String nickname = userJson['nickname'];
      await storage.write(key: 'memberId', value: userJson['memberId']);
      return Member(
        memberId: userJson['memberId'],
        password: '', // 비밀번호는 서버에서 반환되지 않음
        nickname: nickname,
        gender: userJson['gender'],
        birthdate: userJson['birthdate'],
      );
    } else {
      print("로그인 실패: ${response.statusCode}");
      return null;
    }
  } catch (e) {
    print("로그인 요청 실패: $e");
    return null;
  }
}

//회원정보 수정
Future<bool> updateUser(Member member, String memberId) async {
  String userId = memberId;
  try {
    final response = await http.put(
      Uri.parse("http://54.79.110.239:8080/api/members/$userId/edit"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(member.toJson()),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      print("데이터가 성공적으로 전송되었습니다.");
      return true;
    } else {
      print("데이터 전송에 실패했습니다.");
      return false;
    }
  } catch (e) {
    print("Failed to send post data: $e");
    return false;
  }
}

//다이어리 생성
Future<bool> saveDiary(Diaries diary) async {
  try {
    final response = await http.post(
      Uri.parse("http://54.79.110.239:8080/api/diaries/add"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(diary.toJson()),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 201) {
      print("데이터가 성공적으로 전송되었습니다.");
      return true;
    } else {
      print("데이터 전송에 실패했습니다.");
      print('Response Body: ${response.body}');

      return false;
    }
  } catch (e) {
    print("Failed to send post data: $e");
    return false;
  }
}

//diaryID로 조회
Future<Diaries> readDiarybyDiaryId(int diaryId) async {
  final response = await http.get(
    Uri.parse("http://54.79.110.239:8080/api/diaries/$diaryId"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  print('Response Status Code: ${response.statusCode}');
  print('Response Body: ${utf8.decode(response.bodyBytes)}'); //인코딩 깨지는 부분 해결

  if (response.statusCode == 201) {
    final Map<String, dynamic> responseData =
        jsonDecode(utf8.decode(response.bodyBytes));
    final Map<String, dynamic> userJson = responseData['user'];
    return Diaries.fromJson(userJson);
  }
  throw Error();
}

//memberId, writeDate로 조회
Future<Diaries?> readDiarybyDate(String memberId, String writeDate) async {
  final Uri uri =
      Uri.parse("http://54.79.110.239:8080/api/diaries/$memberId/$writeDate");

  try {
    final http.Response response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print('Response Status Code: ${response.statusCode}');
      print(
          'Response Body: ${utf8.decode(response.bodyBytes)}'); // Encoding issue resolved

      final Map<String, dynamic> responseData =
          jsonDecode(utf8.decode(response.bodyBytes));

      return Diaries.fromJson(responseData);
    }
  } catch (e) {
    print("$e");
    return null;
  }
  return null;
}

//다이어리 수정
Future<bool> updateDiary(Diaries diaries, int diaryId) async {
  try {
    final response = await http.put(
      Uri.parse("http://54.79.110.239:8080/api/diaries/$diaryId/edit"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(diaries.toJson()),
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      print("데이터가 성공적으로 전송되었습니다.");
      return true;
    } else {
      print("데이터 전송에 실패했습니다.");
      return false;
    }
  } catch (e) {
    print("Failed to send post data: $e");
    return false;
  }
}

//다이어리 삭제
Future<bool> deleteDiary(String diaryId) async {
  try {
    final response = await http.put(
      Uri.parse("http://54.79.110.239:8080/api/diaries/$diaryId/delete"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      print("데이터가 성공적으로 전송되었습니다.");
      return true;
    } else {
      print("데이터 전송에 실패했습니다.");
      return false;
    }
  } catch (e) {
    print("Failed to send post data: $e");
    return false;
  }
}

//감정통계조회
Future<MonthlyEmotion> readEmotionMonthly(
    String memberId, String writeDate) async {
  final String month = writeDate.substring(0, 6);
  final Uri uri = Uri.parse(
      "http://54.79.110.239:8080/api/emotion/statistics/$memberId?month=$month");

  try {
    final http.Response response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print('Response Status Code: ${response.statusCode}');
    print(
        'Response Body: ${utf8.decode(response.bodyBytes)}'); // Encoding issue resolved

    if (response.statusCode == 200) {
      final Map<String, dynamic>? responseData =
          jsonDecode(utf8.decode(response.bodyBytes));

      return MonthlyEmotion.fromJson(responseData!);
    } else {
      throw Error();
    }
  } catch (e) {
    throw Error();
  }
}

//top3감정조회
Future<List<Top3Emotions>> top3Emotions(
    String memberId, String writeDate) async {
  final String month = writeDate.substring(0, 6);
  List<Top3Emotions> emotionList = [];
  final Uri uri = Uri.parse(
      "http://54.79.110.239:8080/api/emotion/top3/$memberId?month=$month");

  try {
    final http.Response response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print('Response Status Code: ${response.statusCode}');
    print(
        'Response Body: ${utf8.decode(response.bodyBytes)}'); // Encoding issue resolved

    if (response.statusCode == 200) {
      final datas = jsonDecode(utf8.decode(response.bodyBytes));
      for (var data in datas) {
        emotionList.add(Top3Emotions.fromJson(data));
      }
      return emotionList;
    } else {
      throw Error();
    }
  } catch (e) {
    throw Error();
  }
}

//시간별 감정(보류)
Future<HourlyEmotion> hourlyEmotions(String memberId, String writeDate) async {
  final String month = writeDate.substring(0, 2);
  final Uri uri = Uri.parse(
      "http://54.79.110.239:8080/api/emotion/hourly/$memberId?month=$month");

  try {
    final http.Response response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print('Response Status Code: ${response.statusCode}');
    print(
        'Response Body: ${utf8.decode(response.bodyBytes)}'); // Encoding issue resolved

    if (response.statusCode == 200) {
      final Map<String, dynamic>? responseData =
          jsonDecode(utf8.decode(response.bodyBytes));
      if (responseData != null) {
        // Parse response data into Diaries object
        return HourlyEmotion.fromJson(responseData);
      } else {
        throw Error();
      }
    } else {
      throw Error();
    }
  } catch (e) {
    throw Error();
  }
}
