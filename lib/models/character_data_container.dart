import 'package:apimarvel/models/character.dart';

class CharacterDataContainer {
  int? count;
  List<Character>? results;

  CharacterDataContainer({
    this.count,
    this.results,
  });

  CharacterDataContainer.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <Character>[];
      json['results'].forEach((v) {
        results!.add(Character.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
