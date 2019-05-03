import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;
import 'package:flutterigapi/models/mediaModel.dart';

class MediaApiProvider {
  Client client = Client();
  static String tokenIg = ""; //ganti jadi token id instagram
  final _url =
      "https://api.instagram.com/v1/users/self/media/recent/?access_token=$tokenIg";

  Future<Media> fetchMediaList() async {
    final response = await client.get(_url);
    if (response.statusCode == 200) {
      return compute(mediaFromJson, response.body);
    } else {
      throw Exception('Failed to load');
    }
  }
}
