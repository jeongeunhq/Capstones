import 'package:capstones/widgets/phq9test.dart';
import 'package:capstones/widgets/top3_emotion.dart';
import 'package:capstones/widgets/tot_emotion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Statistics extends StatefulWidget {
  final String memberId;
  const Statistics({super.key, required this.memberId});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  late String memberId;
   int bottomNavIndex = 0;
  SharedPreferences? prefs;
  List<String> testScore = ['', ''];

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    var storedTestScore = prefs!.getStringList('testScore') ?? [];

    if (storedTestScore.isEmpty) {
      await prefs!.setStringList('testScore', ['', '']);
    } else {
      if (storedTestScore.length > 2) {
        // Keep only the last two items
        storedTestScore = storedTestScore.sublist(storedTestScore.length - 2);
      }
      await prefs!.setStringList('testScore', storedTestScore);
    }

    if (mounted) {
      setState(() {
        testScore = storedTestScore;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    memberId = widget.memberId;
    _initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: TotalEmotion(memberId: memberId),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  PHQ9(memberId: memberId,)),
                ),
                child: Center(
                child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE3EE),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Text(
                      '우울증 건강 설문\n해보기',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'single_day',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 2,
              child: Center(
                child: Container(
                   padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFF98dfff),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  child: Text(
                    '우울체크 트래킹\n"이전" 검사결과: ${testScore.isNotEmpty ? testScore[0] : ''}\n"이번" 검사결과: ${testScore.length > 1 ? testScore[1] : ''}',
                    textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'single_day',
                      ),
                  ),
                ),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 2,
              child: Top3Emotion(memberId: memberId),
            ),
          ],
        ),
      ),
    );
  }
}