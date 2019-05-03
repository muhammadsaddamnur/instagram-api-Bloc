import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:flutterigapi/models/profileModel.dart';

class ProfileApiProvider {
  Client client = Client();
  static String tokenIg = "1252173143.89a588b.44e5dabb667a4dffa487d8e53f706b5c";
  final _url = "https://api.instagram.com/v1/users/self/?access_token=$tokenIg";

  Future<Profile> fetchProfileList() async {
    final response = await client.get(_url);
    if (response.statusCode == 200) {
      return compute(profileFromJson, response.body);
    } else {
      throw Exception('Failed to load');
    }
  }
}
