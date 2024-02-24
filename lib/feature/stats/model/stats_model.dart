class TaskModel {
  final String title;
  final String text;
  final String folder;
  final String timer;

  TaskModel(
      {required this.title,
      required this.text,
      required this.folder,
      required this.timer});
}

var completedTasksList = [
  TaskModel(
    title: "Take a matching colors test",
    text: "This test will show your child’s fine motor skills",
    folder: "",
    timer: "Feb 25, 2024",
  ),
];

var currentTasks = [
  TaskModel(
    title: "Take an eye movement test",
    text:
        "This test uses AI and will show whether your child has autism symptoms",
    folder: "",
    timer: "Feb 25, 2024",
  ),
  TaskModel(
    title: "Take a hand movement test",
    text:
        "This test uses AI and will show whether your child has autism symptoms",
    folder: "",
    timer: "Feb 25, 2024",
  ),
  TaskModel(
    title: "Rotavirus vaccination",
    text:
        "This test uses AI and will show whether your child has autism symptoms",
    folder: "",
    timer: "Feb 25, 2024",
  ),
];
