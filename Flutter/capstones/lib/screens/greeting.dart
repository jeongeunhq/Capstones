import 'package:flutter/material.dart';
import 'package:capstones/screens/setting.dart';
import 'package:flutter/widgets.dart';

class GreetingPage extends StatelessWidget {
  const GreetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              width: 100,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF98dfff),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF98dfff),
                  fixedSize: const Size(100, 55),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const Setting();
                      },
                    ),
                  );
                },
                child: const Text(
                  '로그아웃',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'single_day',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Container(
            child: const Text(
              '답답하고 힘든 마음, \n기쁜 마음 모두 기룡이에게 \n털어 놓으세요.',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'single_day',
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 370,
              width: 250,
              child: Image.asset(
                'lib/assets/images/giryong.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
