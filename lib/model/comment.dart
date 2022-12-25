import 'user.dart';

class Comment {
  Comment({
    required this.id,
    required this.idTopic,
    required this.fromIdUser,
    required this.toIdUser,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.fromUser,
    required this.toUser,
  });

  String id;
  String idTopic;
  String fromIdUser;
  String toIdUser;
  String description;
  String image;
  String createdAt;
  String updatedAt;
  User fromUser;
  User toUser;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        idTopic: json["id_topic"],
        fromIdUser: json["from_id_user"],
        toIdUser: json["to_id_user"],
        description: json["description"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        fromUser: User.fromJson(json["from_user"]),
        toUser: User.fromJson(json["to_user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_topic": idTopic,
        "from_id_user": fromIdUser,
        "to_id_user": toIdUser,
        "description": description,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "from_user": fromUser.toJson(),
        "to_user": toUser.toJson(),
      };
}
