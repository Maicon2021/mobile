import 'package:apimarvel/models/character_data_container.dart';

class CharacterDataWrapper {
  int? code;
  String? status;
  CharacterDataContainer? data;

  CharacterDataWrapper({
    this.code,
    this.status,
    this.data,
  });

  CharacterDataWrapper.fromJason(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null
        ? CharacterDataContainer.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
