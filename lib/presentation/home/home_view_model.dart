import 'dart:async';

import 'package:clean_architecture/data/data_source/result.dart';
import 'package:clean_architecture/domain/model/photo.dart';
import 'package:clean_architecture/domain/use_case/get_photos_use_case.dart';
import 'package:clean_architecture/presentation/home/home_state.dart';
import 'package:clean_architecture/presentation/home/home_ui_event.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  HomeState _state = HomeState([], false);

  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();

  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.getPhotosUseCase);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();
    final Result<List<Photo>> result = await getPhotosUseCase(query);

    result.when(
      success: (photos) {
        _state = state.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );
    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
