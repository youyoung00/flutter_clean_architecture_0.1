import 'dart:async';

import 'package:clean_architecture/data/photo_api_repository.dart';
import 'package:clean_architecture/model/photo.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository api;

  List<Photo> _photos = [];

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  HomeViewModel(this.api);

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photos = result;
    notifyListeners();
  }
}
