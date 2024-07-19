import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, this.text, this.isFromUser, this.image});
  final Image? image;
  final String? text;
  final bool? isFromUser;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: (isFromUser != null && isFromUser!)
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: BoxConstraints(maxWidth: size.width * 0.8),
            decoration: BoxDecoration(
              color: isFromUser != null && isFromUser!
                  ? Theme.of(context).colorScheme.primaryContainer
                  : Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: BorderRadius.circular(18).copyWith(
                bottomLeft:
                    Radius.circular(isFromUser != null && isFromUser! ? 18 : 0),
                bottomRight: Radius.circular(
                    isFromUser != null && !isFromUser! ? 18 : 0),
                topLeft: const Radius.circular(18),
                topRight: const Radius.circular(18),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: Column(
              children: [
                if (text case final text?)
                  MarkdownBody(
                    data: text,
                    selectable: true,
                  ),
                if (image case final image?) image,
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Message {
  const Message({
    required this.text,
    this.fromUser = false,
    this.image,
  });

  final String text;
  final bool fromUser;
  final Image? image;
}
