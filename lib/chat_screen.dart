import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chatgpt_with_flutter/threedots.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chatmessage.dart';
import 'constant.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  ChatGPT? chatGPT;
  StreamSubscription? _subscription;
  bool _isTyping = false;
    final Color botColor = Color(0xff444654);
  final Color userColor = Color(0xff343541);

  @override
  void initState() {
    super.initState();
    chatGPT = ChatGPT.instance;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "ChatGPT with FLUTTER",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: botColor,
      ),
      body: SafeArea(
        child: Container(
          color: userColor,
          child: Column(
            children: [
              Flexible(
                child: Container(
                  color: userColor,
                  child: ListView.builder(
                    reverse: true,
                    itemCount: _messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _messages[index];
                    },
                  ),
                ),
              ),
              if (_isTyping) const ThreeDots(),
              Container(
                decoration: BoxDecoration(
                  color: botColor,
                ),
                child: _buildTextComposer(),
              ).p8(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            textCapitalization: TextCapitalization.sentences,
            style: const TextStyle(color: Colors.white),
              controller: _controller,
              onSubmitted: (value) => _sendMessage(),
              decoration:
                  InputDecoration(
                    hintText: "Send a messages",
                    hintStyle: const TextStyle(color: Colors.white),
                fillColor: botColor,
                filled: true,
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                
              )),
        ),
        IconButton(
            onPressed: () => _sendMessage(), icon: const Icon(Icons.send,color: Colors.white,))
      ],
    );
  }

  void _sendMessage() {
    ChatMessage message = ChatMessage(text: _controller.text, sender: "User", botColor: botColor, userColor: userColor,);
    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();

    final request = CompleteReq(
      prompt: message.text+"?",
      model: kTranslateModelV3,
      max_tokens: 4000,
      temperature: 0.9,
      top_p: 1,
      frequency_penalty: 0.0,
      presence_penalty: 0.6,
    );
    _subscription = chatGPT
        ?.builder(apiSecretKey,
            orgId: "", baseOption: HttpSetup(receiveTimeout: 100000))
        .onCompleteStream(request: request)
        .listen((response) {
      Vx.log(response!.choices[0].text);
      ChatMessage botMessage = ChatMessage(
        botColor: botColor,
        userColor: userColor,
        text: response.choices[0].text,
        sender: "Bot",
      );
      setState(() {
        _isTyping = false;
        _messages.insert(0, botMessage);
      });
    });
  }
}
