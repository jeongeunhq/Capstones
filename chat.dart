import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  //사용자가 입력한 텍스트 읽는 컨트롤러
  final TextEditingController _textController = TextEditingController();
  //채팅 메세지 저장
  final List<ChatMessage> _messages = <ChatMessage>[];
  //사용자가 입력한 메세지 처리
  void _handleSubmitted(String text) {
    _textController.clear();
    //사용자 입력
    ChatMessage message = ChatMessage(
      text: text,
      isUser: true,
    );
    setState(() {
      //사용자가 보낸 가장 최신의 메시지가 리스트 맨 위에 표시
      _messages.insert(0, message);
      //상대가 보내는 메세지-> 안녕하세요!를 임의로 넣음
      _messages.insert(
          0,
          const ChatMessage(
            text: '안녕하세요!',
            //사용자가 아닌 상대를 나타냄
            isUser: false,
          ));
    });
  }

  //채팅 메세지 표시하는 부분->디자인
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              reverse: true,
              //메세지 수
              itemCount: _messages.length,
              //메세지 생성
              itemBuilder: (_, int index) => _messages[index],
            ),
          ),
          // 메세지와 입력창을 구분하는 가로 선
          const Divider(height: 1.0),
          //입력창과 전송 버튼 포함된 부분
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  //입력창 생성->디자인
  Widget _buildTextComposer() {
    return Builder(
      builder: (BuildContext context) {
        return IconTheme(
          data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                    decoration: const InputDecoration.collapsed(
                        hintText: 'Send a message'),
                  ),
                ),
                //전송 버튼 부분
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_textController.text),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

//체팅 메세지 처리하는 부분
class ChatMessage extends StatelessWidget {
  //메세지
  final String text;
  //메세지의 주인 여부
  final bool isUser;

  const ChatMessage({super.key, required this.text, required this.isUser});
  //채팅 메세지 디자인 부분
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        //왼쪽: 상대, 오른쪽: 사용자
        children: <Widget>[
          if (!isUser)
            Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: const CircleAvatar(
                child: Text('상대'),
              ),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: isUser ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black,
              ),
            ),
          ),
          if (isUser)
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: const CircleAvatar(
                child: Text('User'),
              ),
            ),
        ],
      ),
    );
  }
}
