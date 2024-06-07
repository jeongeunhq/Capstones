import 'package:capstones/api_services/db_connect.dart';
import 'package:capstones/models/diary_model.dart';
import 'package:capstones/widgets/adddiary.dart';
import 'package:capstones/widgets/editdiary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Diary extends StatefulWidget {
  final String memberId;
  final Function(String) updateEmotion;

  const Diary({
    super.key,
    required this.memberId,
    required this.updateEmotion,
  });

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  late DateTime selectedDate;
  late String memberId;
  String writeDate = DateFormat('yyyyMMdd').format(DateTime.now());
  final storage = const FlutterSecureStorage();
  late RefreshController _refreshController;
  SharedPreferences? prefs;
  List<String> writedays = [];
  String? selectedEmotion;
  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;

  @override
  void initState() {
    super.initState();
    memberId = widget.memberId;
    selectedDate = DateTime.now();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
    _initPrefs();
    _refreshController = RefreshController(initialRefresh: false);
  }

  Future<void> _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    _updateWritedays();
  }

  Future<void> _updateWritedays() async {
    final writedaysList = prefs!.getStringList(memberId);

    if (writedaysList != null) {
      writedays = writedaysList;
    } else {
      prefs!.setStringList(memberId, []);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _onRefresh() async {
    _updateWritedays(); // writedays 리스트를 업데이트합니다.
    setState(() {});
    _refreshController.refreshCompleted();
  }

  _asyncMethod() async {
    memberId = (await storage.read(key: 'memberId'))!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (prefs == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF98dfff),
        centerTitle: true,
        title: Text(
          '$currentYear년 $currentMonth월',
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'single_day',
          ),
        ),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        onRefresh: _onRefresh,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SfCalendar(
                showNavigationArrow: true,
                initialSelectedDate: selectedDate,
                view: CalendarView.month,
                headerStyle: const CalendarHeaderStyle(
                  textStyle: TextStyle(
                    fontFamily: 'single_day',
                    fontSize: 22,
                  ),
                ),
                onLongPress: (calendarLongPressDetails) async {
                  writeDate = DateFormat('yyyyMMdd')
                      .format(calendarLongPressDetails.date!);
                  Diaries? content = await readDiarybyDate(memberId, writeDate);
                  if (content != null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog.adaptive(
                          content: Image.asset(
                              'lib/assets/images/${content.emotionType}.png'),
                        );
                      },
                    );
                  }
                },
                onTap: (CalendarTapDetails details) async {
                  setState(() {
                    writeDate = DateFormat('yyyyMMdd').format(details.date!);
                    selectedDate = details.date!;
                  });
                  Diaries? selectedDiary =
                      await readDiarybyDate(memberId, writeDate);
                  setState(() {
                    selectedEmotion = selectedDiary?.emotionType ?? '';
                  });
                  widget.updateEmotion(selectedEmotion!);
                  print(
                      '선택한 날짜의 날짜와 감정: $writeDate, Emotion: $selectedEmotion');
                },
                onViewChanged: (ViewChangedDetails viewChangedDetails) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      currentMonth = viewChangedDetails
                          .visibleDates[
                              viewChangedDetails.visibleDates.length ~/ 2]
                          .month;
                      currentYear = viewChangedDetails
                          .visibleDates[
                              viewChangedDetails.visibleDates.length ~/ 2]
                          .year;
                    });
                  });
                },
                monthCellBuilder: (context, details) {
                  // final writedays = prefs!.getStringList('writedays');
                  if (writedays.isNotEmpty) {
                    for (var day in writedays) {
                      if (day == DateFormat('yyyyMMdd').format(details.date)) {
                        return Center(
                          child: Column(
                            children: [
                              Text(
                                details.date.day.toString(),
                              ),
                              const Text(
                                '●',
                                style: TextStyle(color: Color(0xFF98dfff)),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  }
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          details.date.day.toString(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 100, // 원하는 너비
                        height: 150, // 원하는 높이
                        child: Image.asset('lib/assets/images/giryong.png'),
                      ),
                      Expanded(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFF98dfff),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            '오늘 무슨 일이 있었는지 \n기룡이에게 솔직하게\n 털어 놓아 보아요!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'single_day',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onDoubleTap: () {},
                        onTap: () async {
                          Diaries? newPage =
                              await readDiarybyDate(memberId, writeDate);
                          if (newPage != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditDiaries(diary: newPage),
                              ),
                            );
                          } else {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddDiaries(
                                  memberId: memberId,
                                  selectedDate: writeDate,
                                ),
                              ),
                            );
                          }
                        },
                        child: SizedBox(
                          width: 56.0,
                          height: 56.0,
                          child: Center(
                            child: Image.asset('lib/assets/images/write.png'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
