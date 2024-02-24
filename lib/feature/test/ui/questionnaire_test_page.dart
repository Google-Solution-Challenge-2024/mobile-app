import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/feature/test/model/message_model.dart';
import 'package:solution_app/navigation/auth_navigation.dart';

class QuestionnaireTestPage extends StatefulWidget {
  const QuestionnaireTestPage({super.key});

  @override
  State<QuestionnaireTestPage> createState() => _QuestionnaireTestPageState();
}

class _QuestionnaireTestPageState extends State<QuestionnaireTestPage> {
  TextEditingController messageController = TextEditingController();
  List<MessageModel> messages = [
    MessageModel(message: "Hi! How can I help you?", isMine: false),
  ];
  bool isSent = false;

  String prompt =
      "we are making a mobile application for parents to track their children's  development, early autism detection. Give any info for a parent by their request regarding autism, child development. your response should be maximum 50 words long. here is the message from parent: ";

  final gemini = Gemini.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      floatingActionButton: _buildFloatingBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView.builder(
        itemCount: messages.length + 1,
        reverse: true,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          if (i == 0) {
            return SizedBox(height: 80.h);
          }
          return _buildMesage(messages[i - 1]);
        },
      ),
    );
  }

  Widget _buildMesage(MessageModel msg) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Row(
          mainAxisAlignment:
              msg.isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 100.w,
              decoration: BoxDecoration(
                color: msg.isMine ? Colors.white : theme.primaryColor,
                borderRadius: BorderRadius.circular(15.w),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5.w,
                    color: const Color.fromARGB(255, 232, 232, 232),
                  ),
                ],
              ),
              padding: EdgeInsets.all(15.w),
              child: Column(
                children: [
                  Text(msg.message),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingBtn() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 80.h,
      child: Column(
        children: [
          isSent ? const Text("AI assistant typing ....") : SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.82,
                child: TextField(
                  controller: messageController,
                  decoration: const InputDecoration(
                    hintText: "type your message",
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (messageController.text == "") return;
                  setState(() {
                    isSent = true;
                  });
                  messages.insert(
                    0,
                    MessageModel(message: messageController.text, isMine: true),
                  );
                  gemini.text(prompt + messageController.text).then((value) {
                    if (value == null || value.output == null) return;
                    setState(() {
                      messages.insert(
                        0,
                        MessageModel(message: value.output!, isMine: false),
                      );
                      isSent = false;
                    });
                  }).catchError((e) {
                    // ignore: avoid_print
                    print(e);
                  });

                  messageController.text = "";
                  setState(() {});
                },
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return AppBar(
      leading: IconButton(
        onPressed: () {
          globalSL<AuthNavigation>().globalRouter.pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: theme.textColor1,
        ),
      ),
      title: Text(
        "Chat with AI",
        style: theme.headline3,
      ),
      centerTitle: true,
      elevation: 0,
    );
  }
}
