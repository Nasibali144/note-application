class Note {
  int createdAt;
  String title;
  String content;
  String userId;
  String id;

  Note(this.createdAt, this.title, this.content, this.userId, this.id);

  factory Note.fromJson(Map<String, Object?> json) {
    int createdAt = json["createdAt"] as int;
    String title = json["title"] as String;
    String content = json["content"] as String;
    String userId = json["userId"] as String;
    String id = json["id"] as String;

    return Note(createdAt, title, content, userId, id);
  }

  Map<String, Object> toJson() => {
    "createdAt": createdAt,
    "title": title,
    "content": content,
    "userId": userId,
    "id": id,
  };
}