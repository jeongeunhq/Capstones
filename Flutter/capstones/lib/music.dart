import 'package:capstones/api_services/db_connect.dart';
import 'package:capstones/models/diary_model.dart';
import 'package:flutter/material.dart';
import 'package:capstones/Extant.dart';
import 'package:capstones/KeyWord.dart';
import 'package:intl/intl.dart';

class Music extends StatefulWidget {
  final String? selectedEmotionFromDiary;
  final String memberId;
  final String selectedDate;

  const Music({
    super.key,
    this.selectedEmotionFromDiary,
    required this.memberId,
    required this.selectedDate,
  });

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  String? _selectedEmotionFromKeyWord;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
         
        ),
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
                    child: const Text(
                      '기룡이가 당신의 기분에 맞는 \n음악 추천을 해줄게요!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        fontFamily: 'single_day',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 300,
                    width: 200,
                    child: Image.asset(
                      'lib/assets/images/giryong.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color(0xFF98dfff),
                      fixedSize: const Size(320, 85),
                    ),
                    onPressed: () async {
                      
                      DateTime now = DateTime.now();
                      String writeDate = DateFormat('yyyyMMdd').format(now);
                      Diaries? selectedDiary = await readDiarybyDate(widget.memberId, writeDate);

                      print('Selected Emotion from Diary: $selectedDiary');

                      if (selectedDiary == null){
                        _showDialog(context); // 팝업 표시
                          return;
                      }
                      else{
                        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Extant(
                              selectedEmotion: widget.selectedEmotionFromDiary ?? '',
                              memberId: widget.memberId,
                              selectedDate: widget.selectedDate,
                            );
                          },
                        ),
                      );
                    }},
                    child: const Text(
                      '이미 입력한 \n내용으로 받을게요!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'single_day',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: const Color(0xFF98dfff),
                      fixedSize: const Size(320, 85),
                    ),
                    onPressed: () async {
                        final String? selectedEmotionFromKeyWord =
                          await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const KeyWord();
                          },
                        ),
                      );
                      if (selectedEmotionFromKeyWord != null) {
                        setState(() {
                          _selectedEmotionFromKeyWord = selectedEmotionFromKeyWord;
                        });

                        // Extant 위젯으로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return Extant(
                                selectedEmotion: _selectedEmotionFromKeyWord!,
                                memberId: widget.memberId,
                                selectedDate: widget.selectedDate,
                              );
                            },
                          ),
                        );
                      }
                    },
                    child: const Text(
                      '감정 키워드를 \n직접 고를게요!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontFamily: 'single_day',
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


// 팝업을 표시하는 함수 추가
void _showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          '감정 없음',
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 25,
          fontFamily: 'single_day',
          color: Color.fromARGB(255, 254, 106, 197),
           ),
           ),
        content: const Text(
          '입력된 감정(일기)이 없습니다!',
           style: TextStyle(
          fontSize: 20,
          fontFamily: 'single_day',
           ),
          ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
               style: TextStyle(
          fontSize: 20,
          fontFamily: 'single_day',
           ),
              ),
          ),
        ],
      );
    },
  );
}
