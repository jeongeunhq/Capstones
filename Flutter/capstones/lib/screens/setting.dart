import 'package:capstones/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  static const storage = FlutterSecureStorage();

  logout() async {
    await storage.delete(key: 'memberId');
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyApp(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '로그아웃',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'single_day',
            fontSize: 25.0,
          ),
        ),
        backgroundColor: const Color(0xFF98dfff),
        centerTitle: true,
        elevation: 2,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: logout,
              child: const Text(
                '다음에 또 만나요!',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'single_day',
                  fontSize: 25.0,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'lib/assets/images/giryong.png',
              height: 300,
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF98dfff),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton(
                onPressed: logout,
                child: const Text(
                  '로그아웃하기',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'single_day',
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
