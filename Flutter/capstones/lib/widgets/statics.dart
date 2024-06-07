import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:vertical_barchart/vertical-barchart.dart';
import 'package:vertical_barchart/vertical-barchartmodel.dart';

class Statics extends StatefulWidget {
  final Map<String, dynamic> sentiment;
  const Statics({super.key, required this.sentiment});

  @override
  State<Statics> createState() => _StaticsState();
}

class _StaticsState extends State<Statics> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF87CEFA),
          centerTitle: true,
          title: const Text(
            '오늘의 기분은',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontFamily: 'single_day',
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                children: [
                  // 이미지 크기 조정
                  const SizedBox(width: 20),
                  SizedBox(
                    width: 150,
                    height: 200,
                    child: Image.asset('lib/assets/images/giryong.png'),
                  ),
                  Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color(0xFF98dfff),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '오늘 당신이 느낀 \n기분이에요!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'single_day',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 500,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: SizedBox(
                    width: 500,
                    height: 300,
                    child: _buildChart(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChart() {
    // 여기 sentiment 받아서 처리하기
    double positiveValue =
        ((widget.sentiment['Positive'] ?? 0).toDouble() * 100).roundToDouble();
    double negativeValue =
        ((widget.sentiment['Negative'] ?? 0).toDouble() * 100).roundToDouble();
    double neutralValue =
        ((widget.sentiment['Neutrality'] ?? 0).toDouble() * 100)
            .roundToDouble();
    double mixedValue =
        ((widget.sentiment['Mixed'] ?? 0).toDouble() * 100).roundToDouble();
    final List<VBarChartModel> bardata = [
      VBarChartModel(
        index: 0,
        label: "긍정적이에요!",
        colors: [
          const Color.fromARGB(255, 125, 201, 255),
          const Color.fromARGB(255, 125, 201, 255)
        ],
        jumlah: positiveValue,
        tooltip: "$positiveValue%",
      ),
      VBarChartModel(
        index: 1,
        label: "부정적이에요!",
        colors: [
          const Color.fromARGB(255, 255, 130, 141),
          const Color.fromARGB(255, 255, 130, 141)
        ],
        jumlah: negativeValue,
        tooltip: "$negativeValue%",
      ),
      VBarChartModel(
        index: 2,
        label: "중립이에요!",
        colors: [
          const Color.fromARGB(255, 217, 255, 113),
          const Color.fromARGB(255, 217, 255, 113)
        ],
        jumlah: neutralValue,
        tooltip: "$neutralValue%",
      ),
      VBarChartModel(
        index: 3,
        label: "모호해요!",
        colors: [
          const Color.fromARGB(255, 186, 129, 255),
          const Color.fromARGB(255, 186, 129, 255)
        ],
        jumlah: mixedValue,
        tooltip: "$mixedValue%",
      ),
    ];

    return VerticalBarchart(
      background: Colors.transparent,
      labelColor: const Color(0xff283137),
      tooltipColor: const Color(0xff8e97a0),
      maxX: 100,
      data: bardata,
      barStyle: BarStyle.DEFAULT,
    );
  }
}
