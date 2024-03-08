import 'package:capstones/chat.dart';
import 'package:capstones/diary.dart';
import 'package:capstones/home.dart';
import 'package:capstones/setting.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int bottomNavIndex = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          index: bottomNavIndex,
          children: const [
            Home(),
            Chat(),
            Diary(),
            Setting(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: bottomNavIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          onTap: (index) {
            setState(() {
              bottomNavIndex = index;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈', //홈
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_rounded), //채팅
              label: '채팅',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), //캘린더
              label: '다이어리',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '설정', //설정
            ),
          ],
        ),
      ),
    );
  }
}
