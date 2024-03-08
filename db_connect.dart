import 'dart:convert';

import 'package:capstones/assets/diaries.dart';
import 'package:capstones/assets/login.dart';
import 'package:capstones/assets/members.dart';
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
      return Member(
        memberId: userJson['memberId'],
        password: '', // 비밀번호는 서버에서 반환되지 않음
        nickname: nickname,
        gender: userJson['gender'],
        birthDate: userJson['birthdate'],
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

//다이어리 전송
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

//ID로 일기 조회
Future<Diaries?> readDiary(String memberId) async {
  try {
    final response = await http.get(
      Uri.parse("hhttp://54.79.110.239:8080/api/diaries/member/$memberId"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${utf8.decode(response.bodyBytes)}'); //인코딩 깨지는 부분 해결

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final Map<String, dynamic> userJson = responseData['user'];
      return Diaries(
        memberId: userJson['memberId'],
        diaryId: userJson['diaryId'],
        writeDate: userJson['writeDate'],
        content: userJson['content'],
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

//일기 수정
Future<bool> updateDiary(Diaries diaries, String diaryId) async {
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

//일기 삭제
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
