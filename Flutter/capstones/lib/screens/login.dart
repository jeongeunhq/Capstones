import 'package:flutter/material.dart';

import '../widgets/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              '로그인',
               style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'single_day',
                  ),
              ),
            Image.asset(
              'lib/assets/images/giryong.png',
              width: 50,
              height: 60,
            ),
          ],
        ),
      ),
      body: const LoginForm(),
    );
  }
}