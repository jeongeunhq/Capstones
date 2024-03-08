import 'package:capstones/assets/members.dart';
import 'package:capstones/db_connect.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFffe3ee),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      '심리 케어 기룡이',
                      style: TextStyle(
                        color: Color(0xFFdf999c),
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 400,
                      width: 300,
                      child: Image.asset(
                        'lib/assets/images/giryong.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color(0xFF98dfff),
                      fixedSize: const Size(300, 45),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const Login();
                          },
                        ),
                      );
                    }, //json 전송 후 성공시 화면전환 >> sign_in.dart
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                        color: Color(0xFF84bdf3),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color(0xFF98dfff),
                      fixedSize: const Size(300, 45),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const SignUp();
                          },
                        ),
                      );
                    }, //json 전송 후 성공시 화면전환 >> sign_in.dart
                    child: const Text(
                      '회원가입',
                      style: TextStyle(
                        color: Color(0xFF84bdf3),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('로그인'),
            Image.asset(
              'lib/assets/images/giryong.png',
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController idController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
            const Text('아이디'),
            TextFormField(
              controller: idController,
              decoration: const InputDecoration(
                labelText: 'Id',
                floatingLabelStyle: TextStyle(
                  color: Colors.grey,
                ),
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
            const Text('비밀번호'),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                floatingLabelStyle: TextStyle(
                  color: Colors.grey,
                ),
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
                  // 로그인 성공 시 환영 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          GreetingPage(nickname: loggedInUser.nickname!),
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
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                '비밀번호를 잊어버리셨나요?',
                style: TextStyle(
                  color: Color(0xFF98dfff),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('계정이 없으신가요?'),
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
                    ),
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

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text('환영합니다~'),
            Image.asset(
              'lib/assets/images/giryong.png',
              width: 40,
              height: 40,
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(child: SignUpForm()),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

enum Gender { male, female }

class _SignUpFormState extends State<SignUpForm> {
  String _email = '';
  String _password = '';
  String _nickname = '';
  String _gender = ''; // 'male', 'female'
  String _birthdate = '';
  bool focus = true;

  final TextEditingController _birthdateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('아이디'),
          TextFormField(
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Id',
              floatingLabelStyle: TextStyle(
                color: Colors.grey,
              ),
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
          const SizedBox(
            height: 20,
          ),
          const Text('비밀번호'),
          TextFormField(
            onChanged: (value) {
              setState(() {
                _password = value;
              });
            },
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              floatingLabelStyle: TextStyle(
                color: Colors.grey,
              ),
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
          const SizedBox(
            height: 20,
          ),
          const Text('닉네임'),
          TextFormField(
            onChanged: (value) {
              setState(() {
                _nickname = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Nickname',
              floatingLabelStyle: TextStyle(
                color: Colors.grey,
              ),
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
          const Text('성별', style: TextStyle(fontSize: 16)),
          ListTile(
            selectedColor: Colors.blue,
            title: const Text('남성'),
            leading: Radio(
              value: Gender.male,
              groupValue: _gender,
              onChanged: (value) {
                _gender = value.toString();
              },
            ),
          ),
          ListTile(
            selectedColor: Colors.blue,
            title: const Text('여성'),
            leading: Radio(
              value: Gender.female,
              groupValue: _gender,
              onChanged: (value) {
                _gender = value.toString();
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text('생년월일'),
          TextFormField(
            controller: _birthdateController,
            onChanged: (value) {
              setState(() {
                _birthdate = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'YYYYMMDD',
              floatingLabelStyle: TextStyle(
                color: Colors.grey,
              ),
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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF98dfff),
              fixedSize: const Size(400, 45),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            onPressed: () async {
              // 회원가입 정보 생성
              Member newMember = Member(
                memberId: _email,
                password: _password,
                nickname: _nickname,
                gender: _gender,
                birthDate: _birthdate,
              );
              // 회원가입 정보 서버에 전송
              await saveUser(newMember); // saveUser 함수 호출을 await로 감싸기
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: const Text(
              '회원가입 하기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GreetingPage extends StatelessWidget {
  final String nickname;

  const GreetingPage({super.key, required this.nickname});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text(
                '답답하고 힘든 마음, 기쁜 마음 모두 기룡이에게 털어 놓으세요.',
                style: TextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset('lib/assets/images/giryong.png'),
          ],
        ),
      ),
    );
  }
}
