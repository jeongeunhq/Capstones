import 'package:capstones/assets/diaries.dart';
import 'package:capstones/db_connect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Diary extends StatefulWidget {
  const Diary({super.key});

  @override
  State<Diary> createState() => _DiaryState();
}

class _DiaryState extends State<Diary> {
  late DateTime selectedDate;
  bool isWrite = false;
  late String memberId;

  @override
  void initState() {
    selectedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF98dfff),
        title: const Text('My Diary'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: SfCalendar(
              initialSelectedDate: selectedDate,
              view: CalendarView.month,
              onTap: (CalendarTapDetails details) {
                setState(() {
                  selectedDate = details.date!;
                  print(selectedDate);
                });
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Image.asset('lib/assets/images/giryong.png'),
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF98dfff),
                  ),
                  child: const Text(
                    '오늘 무슨 일이 있었는지 \n기룡이에게 솔직하게\n 털어 놓아 보아요!',
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (isWrite == false) {
            String? newPage = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddDiaries(
                  selectedDate: selectedDate,
                ),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditDiaries(memberId: memberId),
              ),
            );

            setState(() {
              isWrite = true;
            });
          }
          /*
          String? newEntry = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddEntryPage(selectedDate)),
          );
          if (newEntry != null) {
            setState(
              () {
                entries.add(DiaryEntry(
                  text: newEntry,
                  date: selectedDate ?? DateTime.now(),
                ));
              },
            );
          }
        */
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class AddDiaries extends StatefulWidget {
  final DateTime selectedDate;
  const AddDiaries({super.key, required this.selectedDate});

  @override
  State<AddDiaries> createState() => _AddDiariesState();
}

class _AddDiariesState extends State<AddDiaries> {
  late String _content;
  late DateTime _writeDate;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    _writeDate = widget.selectedDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('페이지 추가'),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: Column(
            children: [
              Text(
                  "${_writeDate.month.toString().padLeft(2, '0')}-${_writeDate.day.toString().padLeft(2, '0')}"),
              const SizedBox(
                height: 16,
              ),
              TextField(
                expands: true,
                controller: _textEditingController,
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    _content = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Diaries newPage = Diaries(
            writeDate: _writeDate.toString(),
            content: _content,
          );
          await saveDiary(newPage);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Diary(),
              ));
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

//원래 써 놧던 내용을 조회 후 수정 및 저장
class EditDiaries extends StatefulWidget {
  final String memberId;
  const EditDiaries({super.key, required this.memberId});

  @override
  State<EditDiaries> createState() => _EditDiariesState();
}

class _EditDiariesState extends State<EditDiaries> {
  late Future<Diaries?> diaries;
  bool isWrite = false;
  late TextEditingController _textEditingController;
  late String memberId;

  @override
  void initState() {
    super.initState();
    memberId = widget.memberId;
    diaries = readDiary(memberId); //memberId
    _textEditingController = TextEditingController(text: diaries.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          child: Column(
            children: [
              FutureBuilder(
                future: diaries,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        TextField(
                          controller: _textEditingController,
                          enabled: isWrite,
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isWrite = true;
          });
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
