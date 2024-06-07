import 'package:capstones/screens/home.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: const Center(
          child: DefaultTextStyle(
            style: TextStyle(fontFamily: 'single_day'),
            child: Home(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xFF98dfff),
          selectedItemColor: const Color.fromARGB(255, 75, 116, 149),
          unselectedItemColor: Colors.black,
          showUnselectedLabels: false,
          items: [
            const BottomNavigationBarItem(
             icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 24,
                  width: 24,
                 // child: Icon(Icons.settings), 
                ),
              ),
              label: ' ', 
            ),
             BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset(
                    'lib/assets/images/home.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              label: '홈',
            ),
            const BottomNavigationBarItem(
             icon: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 24,
                  width: 24,
                 // child: Icon(Icons.settings), 
                ),
              ),
              label: ' ', 
            ),
          ],
        ),
      ),
    );
  }
}