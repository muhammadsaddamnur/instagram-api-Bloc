import 'dart:async';

import 'package:flutterigapi/models/mediaModel.dart';
import 'package:flutterigapi/models/profileModel.dart';
import 'package:flutterigapi/resources/mediaModelProfider.dart';
import 'package:flutterigapi/resources/profileModelProfider.dart';

class Repository {
  final profileApiProfider = ProfileApiProvider();
  final mediaApiProfider = MediaApiProvider();

  Future<Profile> fetchAllProfile2() => profileApiProfider.fetchProfileList();
  Future<Media> fetchAllMedia2() => mediaApiProfider.fetchMediaList();
}
