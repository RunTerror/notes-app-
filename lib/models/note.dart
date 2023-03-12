class Note {
  String? id;
  String? userId;
  String? title;
  String? content;
  DateTime? dateTime;
  Note({this.id, this.content, this.dateTime, this.title, this.userId});

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
        content: map["content"],
        dateTime: DateTime.tryParse(map["dateTime"]),
        id: map["id"],
        title: map["title"],
        userId: map["userId"]);
  }

  Map<String, dynamic> jhatu() {
    return {
      "id": id,
      "content": content,
      "title": title,
      "dateTime": dateTime!.toIso8601String(),
      "userId": userId
    };
  }
}
