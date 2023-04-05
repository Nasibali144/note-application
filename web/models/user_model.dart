class User {
  int createdAt;
  String name;
  String imageUrl;
  String email;
  String password;
  String id;

  User(this.createdAt, this.name, this.imageUrl, this.email, this.password,
      this.id);

  factory User.fromJson(Map<String, Object?> json) {
    int createdAt = json["createdAt"] as int;
    String name = json["name"] as String;
    String imageUrl = json["imageUrl"] as String;
    String email = json["email"] as String;
    String password = json["password"] as String;
    String id = json["id"] as String;

    return User(createdAt, name, imageUrl, email, password, id);
  }

  Map<String, Object> toJson() => {
        "createdAt": createdAt,
        "name": name,
        "imageUrl": imageUrl,
        "email": email,
        "password": password,
        "id": id,
      };
}
