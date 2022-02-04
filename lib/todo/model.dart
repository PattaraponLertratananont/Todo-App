class TodoModel {
  final String title;
  final bool finished;

  TodoModel({
    required this.title,
    required this.finished,
  });

  TodoModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        finished = json["finished"];

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["title"] = title;
    data["finished"] = finished;
    return data;
  }
}
