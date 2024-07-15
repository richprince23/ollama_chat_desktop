import 'dart:developer';

import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: LayoutBuilder(builder: (context, constraints) {
        log(constraints.maxHeight.toString());
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text("Hello"),
              const Expanded(
                child: Text("Hello world"),
              ),
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
                          onPressed: () {},
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
        );
      }),
    );
  }
}
