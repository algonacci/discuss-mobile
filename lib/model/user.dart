class User {
  User({
    required this.id,
    required this.username,
    required this.password,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String username;
  String password;
  String image;
  String createdAt;
  String updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
