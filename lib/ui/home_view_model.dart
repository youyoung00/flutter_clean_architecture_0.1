import 'dart:async';

import 'package:clean_architecture/data/api.dart';
import 'package:clean_architecture/model/photo.dart';

class HomeViewModel {
  final PixabayApi api;

  HomeViewModel(this.api);

  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }
}
