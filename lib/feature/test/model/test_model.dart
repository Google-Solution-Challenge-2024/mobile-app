import 'package:solution_app/navigation/auth_navigation.dart';

class TestModel {
  final String path;
  final String instruction;
  final String title;
  final String icon;

  TestModel({
    required this.path,
    required this.instruction,
    required this.title,
    required this.icon,
  });
}

List<TestModel> generalTestsList = [
  TestModel(
    path: AuthNavigation.handTest,
    instruction:
        "Make a video of your child and upload the video. Video should contain hands of the chidl.",
    title: "Hand movement",
    icon: "assets/icons/hands.svg",
  ),
  TestModel(
      path: AuthNavigation.chatTest,
      instruction: "Chat with AI model trained for supporting parents",
      title: "M-CHAT-R autism",
      icon: "assets/icons/chat.svg"),
  TestModel(
      path: AuthNavigation.eyeTest,
      instruction: "Press the play button and give the phone to your child",
      title: "Eye movement",
      icon: "assets/icons/eye.svg"),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Chat with AI model trained for supporting parents",
    title: "Behavioral",
    icon: "assets/icons/list.svg",
  ),
  TestModel(
    path: AuthNavigation.physicalTest,
    instruction: "Chat with AI model trained for supporting parents",
    title: "Physical behavior",
    icon: "assets/icons/phys.svg",
  ),
  TestModel(
    path: AuthNavigation.matchingColorsTest,
    instruction: "Drop colors to matching squares.",
    title: "Matching colors",
    icon: "assets/icons/game.svg",
  ),
];

List<TestModel> specialTestList = [
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Chat with AI model trained for supporting parents",
    title: "Medicines",
    icon: "assets/icons/medicine.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Chat with AI model trained for supporting parents",
    title: "Exercises",
    icon: "assets/icons/exercises.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Chat with AI model trained for supporting parents",
    title: "Hospitals",
    icon: "assets/icons/hospitals.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Chat with AI model trained for supporting parents",
    title: "Articles",
    icon: "assets/icons/articles.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Chat with AI model trained for supporting parents",
    title: "Videos",
    icon: "assets/icons/videos.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Chat with AI model trained for supporting parents",
    title: "Food",
    icon: "assets/icons/food.svg",
  ),
];
