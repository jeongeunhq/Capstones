
import 'package:capstones/api_services/db_connect.dart';
import 'package:capstones/models/statistics_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Top3Emotion extends StatefulWidget {
  final String memberId;
  const Top3Emotion({super.key, required this.memberId});

  @override
  State<Top3Emotion> createState() => _Top3EmotionState();
}

class _Top3EmotionState extends State<Top3Emotion> {
  String writeDate = DateFormat('yyyyMMdd').format(DateTime.now()).toString();
  late String memberId;
  late Future<List<Top3Emotions>> top3;
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    memberId = widget.memberId;
    top3 = top3Emotions(memberId, writeDate);
    _refreshController = RefreshController(initialRefresh: false);
  }

  Future<void> _onRefresh() async {
    // Fetch new data
    setState(() {
      top3 = top3Emotions(memberId, writeDate);
    });
    // Call refresh complete when finished
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      onRefresh: _onRefresh,
      child: Column(
        children: [
          Row(
            children: [
              Title(
                color: Colors.black,
                child: const Text(
                   textAlign: TextAlign.center,
                  '   이번달 당신이 가장 많이 느낀 감정이에요!',
                      style: TextStyle(
                        fontSize: 20,
                        //fontWeight: FontWeight.bold,
                        fontFamily: 'single_day',
                      ),
                      ),
              ),
            ],
          ),
          FutureBuilder(
            future: top3,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: makeList(snapshot),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}

ListView makeList(AsyncSnapshot<List<Top3Emotions>> snapshot) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    padding: const EdgeInsets.all(8),
    itemBuilder: (context, index) {
      var rank = snapshot.data![index];
      return Top3(
        emotionType: rank.emotionType,
        count: rank.count,
      );
    },
    separatorBuilder: (context, index) => const SizedBox(
      width: 25,
    ),
  );
}

class Top3 extends StatelessWidget {
  final String emotionType;
  final int count;
  const Top3({
    super.key,
    required this.emotionType,
    required this.count,
  });

  @override
Widget build(BuildContext context) {
  return SizedBox(
    width: 110, // 원하는 너비로 설정
    height: 150, // 이미지와 텍스트를 포함한 높이로 설정
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'lib/assets/images/$emotionType.png',
          width: 110,
          height: 110,
        ),
        const SizedBox(height: 5), // 이미지와 텍스트 사이의 간격
        Text(
          emotionType, // 원하는 텍스트로 변경
          style: const TextStyle(fontSize: 10), // 적절한 크기로 텍스트 스타일 설정
        ),
      ],
    ),
  );
}

}
