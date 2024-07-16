import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ollama_chat_desktop/widget/message_item.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _streamController = StreamController();

  List<Message> history = [];

  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> sendMessage(String message) async {
    http.Client client = http.Client();
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
        history.add(Message(text: message, fromUser: true));
      });
      // final response = await chat.sendMessage(content);
      // var headers = {
      //   'Cache-Control': 'no-cache',
      //   'Accept': '*/*',
      //   'Accept-Encoding': 'gzip, deflate',
      //   'Connection': 'keep-alive'
      // };
      // final url = Uri.parse('http://127.0.0.1:11434/api/generate');
      // final request = http.Request('POST', url)
      //   ..headers['Content-Type'] = 'application/json'
      //   ..body = jsonEncode({
      //     'model': 'deepseek-coder:latest',
      //     'prompt': 'Why is the sky blue?',
      //     'stream': false,
      //   });

      // final streamedResponse = await http.Client().send(request);
      // print(streamedResponse.statusCode);
      // final tokens = await streamedResponse.stream
      //     .transform(utf8.decoder)
      //     .transform(const LineSplitter())
      //     .join('\n');

      // var headers = {
      //   'Cache-Control': 'no-cache',
      //   'Accept': '*/*',
      //   'Accept-Encoding': 'gzip, deflate',
      //   'Connection': 'keep-alive'
      // };
      // var request =
      //     http.Request('GET', Uri.parse('http://127.0.0.1:11434/api/tags'));
      // request.body =
      //     '''{\n    "model": "deepseek-coder:latest",\n    "prompt": "Why is the sky blue?",\n    "stream": false\n}''';
      // request.headers.addAll(headers);

      var headers = {
        'Content-type': 'application/json',
      };
      var response = await client
          // .get(Uri.parse("http://127.0.0.1:11434/api/tags"), headers: headers);
          .get(Uri.parse("https://api.infoctess-uew.org/members"),
              headers: headers);

      //  if (response.statusCode == 200){
      //   http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.body);
      } else {
        print(response.reasonPhrase);
      }

      // print(response.stream.toBytes().toString());
      setState(() {
        _isLoading = false;
        history.add(Message(text: response.body, fromUser: false));
      });
      // print(tokens);
    } catch (e) {
      setState(() {
        _isLoading = false;
        _errorMessage = e.toString();
        history.add(Message(text: _errorMessage, fromUser: false));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.view_sidebar_outlined),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("Hello"),
            Expanded(
                child: ListView.builder(
              // controller: _scrollController,
              itemBuilder: (context, idx) {
                final content = history[idx];
                return MessageItem(
                  text: content.text,
                  // image: content.image,
                  isFromUser: content.fromUser,
                );
              },
              itemCount: history.length,
            )),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.grey.shade200,
              ),
              // padding: const EdgeInsets.all(40),
              // width: MediaQuery.of(context).size.width * 0.8,
              // height: 40,
              child: Form(
                key: _formKey,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        maxLines: 5,
                        minLines: 1,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          fillColor: Colors.white70,
                          hintText: "Enter prompt here",
                          border: InputBorder.none,
                        ),
                        textInputAction: TextInputAction.send,
                        controller: _textController,
                        onFieldSubmitted: (value) {
                          log("submited $value");
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 2,
                        vertical: 1,
                      ),
                      child: IconButton(
                        onPressed: () {
                          sendMessage(_textController.text.trim());
                        },
                        icon: const Icon(Icons.send),
                        style: IconButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
