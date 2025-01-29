class TodoModel {
  String title;
  bool isCompleted;

  TodoModel({
    required this.title,
    required this.isCompleted,
  });

  // This is factory constructor. This is used to covert the json into todomodel object

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}
