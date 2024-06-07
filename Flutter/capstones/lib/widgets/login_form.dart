import 'package:capstones/api_services/db_connect.dart';
import 'package:capstones/loginedmain.dart';
import 'package:capstones/models/member_model.dart';
import 'package:capstones/widgets/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final storage = const FlutterSecureStorage();
  dynamic userInfo = ' ';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    userInfo = await storage.read(key: 'memberId');

    if (userInfo != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginedMain(memberId: userInfo,selectedDate: DateTime.now().toString(),),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              '아이디',
              style: TextStyle(
                  color: Colors.black, fontSize: 25, fontFamily: 'single_day'),
            ),
            TextFormField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'Id',
                floatingLabelStyle:
                    TextStyle(color: Colors.grey, fontFamily: 'single_day'),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF98dfff),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF98dfff),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              '비밀번호',
              style: TextStyle(
                  color: Colors.black, fontSize: 25, fontFamily: 'single_day'),
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                floatingLabelStyle:
                    TextStyle(color: Colors.grey, fontFamily: 'single_day'),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF98dfff),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF98dfff),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              height: 100,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF98dfff),
                fixedSize: const Size(400, 45),
              ),
              onPressed: () async {
                String id = idController.text;
                String password = passwordController.text;
                // 로그인 요청
                Member? loggedInUser = await loginUser(id, password);
                if (loggedInUser != null) {
                  await storage.write(
                    key: 'memberId',
                    value: loggedInUser.memberId,
                  );
                  // await prefs.setBool(key, value);
                  // 로그인 성공 시 환영 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginedMain(
                        memberId: id,
                        selectedDate: DateTime.now().toString(),
                      ),
                    ),
                  );
                } else {
                  // 로그인 실패 처리
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('로그인 실패'),
                        content: const Text('아이디 또는 비밀번호가 올바르지 않습니다.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('확인'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text(
                '로그인하기',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontFamily: 'single_day'),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                '비밀번호를 잊어버리셨나요?',
                style: TextStyle(
                    color: Color(0xFF98dfff),
                    fontSize: 20,
                    fontFamily: 'single_day'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '계정이 없으신가요?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'single_day'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text(
                    '회원가입',
                    style: TextStyle(
                        color: Color(0xFF98dfff),
                        fontSize: 25,
                        fontFamily: 'single_day'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}