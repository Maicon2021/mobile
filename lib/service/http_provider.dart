import 'dart:convert';

import 'package:apimarvel/const/const.dart';
import 'package:apimarvel/models/character_data_wrapper.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class HttpProvider {
  final String url = 'http://gateway.marvel.com/v1/public/characters';
  final String privateKey = Const().PRIVATE_API_KEY;
  final String publicKey = Const().PUBLIC_API_KEY;

  Future<CharacterDataWrapper> getApi() async {
    var timeStamp = DateTime.now().millisecondsSinceEpoch;
    String hash =
        md5.convert(utf8.encode('$timeStamp$privateKey$publicKey')).toString();
    var response = await http
        .get(Uri.parse("$url?ts=$timeStamp&apikey=$publicKey&hash=$hash"));

    
    return CharacterDataWrapper.fromJason(jsonDecode(response.body));
  }
}
