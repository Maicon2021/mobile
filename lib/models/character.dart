import 'package:apimarvel/models/thumbnail.dart';

class Character {
  int? id;
  String? name;
  String? description;
  Thumbnail? thumbnail;

  Character({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
  });

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'] != null
        ? Thumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;    
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail!.toJson();
    }
    return data;
  }
}
