import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

// enum DataKind { NONE, JOY, HOPE, NEUTRALITY, SADNESS, ANGER, ANXIETY, TIREDNESS, REGRET }
enum DataKind { OK }
enum Kind { NONE, EMPATHY, OVERCOME }

Future<String?> fetchString(DataKind dataKind, String emotion) async {
  final Uri url = Uri.parse('http://3.35.183.52:8081/music/recommendation');
  final http.Response response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'emotion': emotion}),
  );
  
  if (response.statusCode == 200) {
    print('감정 전송 성공: ${response.body}');
  } else {
    print('감정 전송 실패: ${response.statusCode}');
  }

  print("========================");
  print(response.body);
  print("========================");

  return response.body;
}

class KeyWordToMusic extends StatefulWidget {
   final String emotion;
   const KeyWordToMusic({super.key, required this.emotion});

  @override
  _KeyWordToMusicState createState() => _KeyWordToMusicState();
}

class _KeyWordToMusicState extends State<KeyWordToMusic> {
  String _selectedCategory = 'empathy';
  final String musicRecommendationUrl = 'https://youtu.be/XEfle_XvYiw?si=sS2MryzR7k2d6z3w';
  final ScrollController _scrollController = ScrollController(); 

  Kind mKind = Kind.NONE;
  DataKind nKind = DataKind.OK;

  Widget makeChild(String str, Kind kind) {
  Map<String, dynamic> items = jsonDecode(str);

  List<Widget> widgetListA = [];
  List<Widget> widgetListB = [];
  switch (kind) {
    case Kind.NONE:
      return Container(); // Return an empty container when no category is selected

    case Kind.EMPATHY:
      
      for (int i = 0; i < 5; i++) {
        final musicName = items['empathy'][i]['name'];
        final musicArtist = items['empathy'][i]['artist'];
        widgetListA.add(
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(items['empathy'][i]['image']),
                  const SizedBox(height: 20),
                  const SizedBox(width: 50),
                  InkWell(
                    onTap: () {
                      //_launchURL(musicRecommendationUrl);
                    },
                    child: Container(
                      width: 200,
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            musicName,
                            style: const TextStyle (
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 89, 130),
                            ),
                          ),
                          Text(
                            musicArtist,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 145, 211),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]
          )
        );
      }
      return Column(children: widgetListA);

    case Kind.OVERCOME:
      
      for (int i = 0; i < 5; i++) {
        final musicName = items['overcome'][i]['name'];
        final musicArtist = items['overcome'][i]['artist'];
        widgetListB.add(
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(items['overcome'][i]['image']),
                  const SizedBox(height: 20),
                  const SizedBox(width: 50),
                  InkWell(
                    onTap: () {
                      //_launchURL(musicRecommendationUrl);
                    },
                    child: Container(
                      width: 200,
                      height: 100,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            musicName,
                            style: const TextStyle (
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 89, 130),
                            ),
                          ),
                          Text(
                            musicArtist,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 0, 145, 211),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ]
          )
        );
      }
      return Column(children: widgetListB);

    default:
      return Column(children: widgetListA);
  }
}


  @override
  Widget build(BuildContext context) {
    mKind = Kind.EMPATHY;
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
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 180,
                    width: 120,
                    child: Image.asset(
                      'lib/assets/images/${widget.emotion}.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                   const SizedBox(height: 20),
                  Text(
                    '"${widget.emotion}"에 어울리는 음악',
                    style: const TextStyle(
                      fontSize: 22,
                      fontFamily: 'single_day',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'empathy';
                            mKind = Kind.EMPATHY;
                          });
                        },
                        child: Container(
                          width: 150,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: _selectedCategory == 'empathy'
                                ? Colors.grey
                                : Colors.transparent,
                          ), 
                          child: const Text(
                            'Empathy',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'single_day',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategory = 'overcome';
                            mKind = Kind.OVERCOME;
                          });
                        },
                        child: Container(
                          width: 150,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: _selectedCategory == 'overcome'
                                ? Colors.grey
                                : Colors.transparent,
                          ),
                          child: const Text(
                            'Overcome',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'single_day',
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 300,
                    child: Scrollbar(
                      thumbVisibility: true,
                      controller: _scrollController,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        controller: _scrollController,
                        child: Column(
                          children: [
                            
                            FutureBuilder(
                              future: fetchString(nKind, widget.emotion),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.done) {
                                  if (mKind == Kind.OVERCOME) {
                                    return Center(
                                    child: makeChild(snapshot.data.toString(), Kind.OVERCOME),
                                  );
                                  }
                                  return Center(
                                    child: makeChild(snapshot.data.toString(), mKind),
                                  );
                                }
                                else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                else {return const Center(
                                  child: CircularProgressIndicator(),
                                );
                                }
                              },
                            ),
                          ]
                        ),
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

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class MusicRecommendationItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artist;
  final String url;

  const MusicRecommendationItem({super.key, 
    required this.imageUrl,
    required this.title,
    required this.artist,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL(url);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 55),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'single_day',
                  color: Colors.black,
                ),
              ),
              Text(
                artist,
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'single_day',
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}