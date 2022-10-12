class TodoModel {
  int? id;
  int? userId;
  String? title;
  bool completed;
  TodoModel({this.id, this.userId, this.title, required this.completed});

  factory TodoModel.fromJson(Map data) {
    return TodoModel(
      id: data['id'] as int,
      userId: data['userId'] as int,
      title: data['title'],
      completed: data['completed'],
    );
  }
}
