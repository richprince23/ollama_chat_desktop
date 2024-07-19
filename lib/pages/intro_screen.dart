import 'package:flutter/material.dart';
import 'package:ollama_chat_desktop/pages/chat_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Ollama Chat Desktop",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 60,
              ),
              const Text(
                  "Hello World! This is a very simple app to help you use LLMs locally and have a chat feel"),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Please make sure you have ollama running on your machine to be able to use this app",
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const ChatScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Get Started"),
                ),
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 40,
        margin: const EdgeInsets.all(20),
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        child: const Text("Made with Flutter with ❤️"),
      ),
    );
  }
}
