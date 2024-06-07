import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:capstones/widgets/KeyWordToMusic.dart';

class KeyWord extends StatefulWidget {
  const KeyWord({super.key});

@override
  _KeyWordState createState() => _KeyWordState();
}

class _KeyWordState extends State<KeyWord> {
  late String selectedEmotion;

void _onEmotionSelected(String emotion) {
  setState(() {
    selectedEmotion = emotion;
  });
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => KeyWordToMusic(emotion: emotion),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 250,
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: const Text(
                      '오늘 당신의 \n감정 키워드는 무엇인가요?',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'single_day',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        _buildEmotionRow(
                          'joy',
                          'hope',
                          'lib/assets/images/joy.png',
                          'lib/assets/images/hope.png',
                        ),
                        _buildEmotionRow(
                          'anger',
                          'sadness',
                          'lib/assets/images/anger.png',
                          'lib/assets/images/sadness.png',
                        ),
                        _buildEmotionRow(
                          'anxiety',
                          'tiredness',
                          'lib/assets/images/anxiety.png',
                          'lib/assets/images/tiredness.png',
                        ),
                        _buildEmotionRow(
                          'regret',
                          'neutrality',
                          'lib/assets/images/regret.png',
                          'lib/assets/images/neutrality.png',
                        ),
                      ],
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

  Widget _buildEmotionRow(
    String emotion1,
    String emotion2,
    String imagePath1,
    String imagePath2,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildEmotionWidget(emotion1, imagePath1),
        _buildEmotionWidget(emotion2, imagePath2),
      ],
    );
  }

Widget _buildEmotionWidget(String text, String imagePath) {
  return GestureDetector(
    onTap: () {
      _onEmotionSelected(text); // 이미지를 클릭하여 해당 감정을 선택할 때 해당 감정 텍스트를 매개변수로 전달
    },
    child: Column(
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: Image.asset(
            imagePath,
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontFamily: 'single_day',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
}