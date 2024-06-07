import 'package:capstones/api_services/db_connect.dart';
import 'package:capstones/models/statistics_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TotalEmotion extends StatefulWidget {
  final String memberId;
  const TotalEmotion({super.key, required this.memberId});

  @override
  State<TotalEmotion> createState() => _TotalEmotionState();
}

class _TotalEmotionState extends State<TotalEmotion> {
  late Future<MonthlyEmotion> sentiment;
  String writeDate = DateFormat('yyyyMMdd').format(DateTime.now()).toString();
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    sentiment = readEmotionMonthly(widget.memberId, writeDate);
    _refreshController = RefreshController(initialRefresh: false);
  }

  Future<void> _onRefresh() async {
    // Fetch new data
    setState(() {
      sentiment = readEmotionMonthly(widget.memberId, writeDate);
    });
    // Call refresh complete when finished
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ // 위에 여백을 추가하고 싶다면 사용
        const Text(
          '월간 감정 통계', // 원하는 텍스트로 변경
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'single_day',), // 적절한 크기로 텍스트 스타일 설정
        ),
        const SizedBox(height: 5), // 텍스트와 리프레셔 사이의 간격
        Expanded(
          child: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            onRefresh: _onRefresh,
            child: FutureBuilder(
              future: sentiment,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return _buildChart(snapshot);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ],
    );

  }
}

Widget _buildChart(AsyncSnapshot<MonthlyEmotion> snapshot) {
  var sentiment = snapshot.data!;

  // 여기 sentiment 받아서 처리하기
  double joy = (double.parse(sentiment.joy.replaceAll('%', '')));
  double hope = (double.parse(sentiment.hope.replaceAll('%', '')));
  double neutrality = (double.parse(sentiment.neutrality.replaceAll('%', '')));
  double sadness = (double.parse(sentiment.sadness.replaceAll('%', '')));
  double anger = (double.parse(sentiment.anger.replaceAll('%', '')));
  double anxiety = (double.parse(sentiment.anxiety.replaceAll('%', '')));
  double tiredness = (double.parse(sentiment.tiredness.replaceAll('%', '')));
  double regret = (double.parse(sentiment.regret.replaceAll('%', '')));

  final List<_ChartData> chartData = [
    _ChartData('기쁨', joy, const Color.fromARGB(255, 251, 238, 121)),
    _ChartData('희망', hope, const Color.fromARGB(255, 167, 252, 169)),
    _ChartData('중립', neutrality, const Color.fromARGB(255, 187, 187, 187)),
    _ChartData('슬픔', sadness, const Color.fromARGB(255, 139, 203, 255)),
    _ChartData('화남', anger, const Color.fromARGB(255, 255, 146, 138)),
    _ChartData('불안', anxiety, const Color.fromARGB(255, 255, 169, 95)),
    _ChartData('피곤', tiredness, const Color.fromARGB(255, 139, 150, 253)),
    _ChartData('후회', regret, const Color.fromARGB(255, 255, 113, 205)),
  ];

  return SfCartesianChart(
    primaryXAxis: const CategoryAxis(
      labelStyle: TextStyle(fontSize: 12,fontFamily: 'single_day',),
    ),
    primaryYAxis: const NumericAxis(
      minimum: 0,
      maximum: 50,
      interval: 25,
    ),
    series: [
      ColumnSeries<_ChartData, String>(
        dataSource: chartData,
        xValueMapper: (chartData, _) => chartData.x,
        yValueMapper: (chartData, _) => chartData.y,
        pointColorMapper: (chartData, _) => chartData.color,
      )
    ],
  );
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x;
  final double y;
  final Color color;
}