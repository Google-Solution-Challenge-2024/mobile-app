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
      instruction: "Finish the questionnaire",
      title: "M-CHAT-R autism",
      icon: "assets/icons/chat.svg"),
  TestModel(
      path: AuthNavigation.eyeTest,
      instruction: "Press the play button and give the phone to your child",
      title: "Eye movement",
      icon: "assets/icons/eye.svg"),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Finish the questionnaire",
    title: "Behavioral",
    icon: "assets/icons/list.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Finish the questionnaire",
    title: "Physical behavior",
    icon: "assets/icons/phys.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Finish the questionnaire",
    title: "Matching colors",
    icon: "assets/icons/game.svg",
  ),
];

List<TestModel> specialTestList = [
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Finish the questionnaire",
    title: "Medicines",
    icon: "assets/icons/medicine.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Finish the questionnaire",
    title: "Exercises",
    icon: "assets/icons/exercises.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Finish the questionnaire",
    title: "Hospitals",
    icon: "assets/icons/hospitals.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Finish the questionnaire",
    title: "Articles",
    icon: "assets/icons/articles.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Finish the questionnaire",
    title: "Videos",
    icon: "assets/icons/videos.svg",
  ),
  TestModel(
    path: AuthNavigation.behavioralTest,
    instruction: "Finish the questionnaire",
    title: "Food",
    icon: "assets/icons/food.svg",
  ),
];
