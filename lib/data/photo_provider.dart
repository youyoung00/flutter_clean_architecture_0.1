import 'package:clean_architecture/ui/home_view_model.dart';
import 'package:flutter/material.dart';

class PhotoProvider extends InheritedWidget {
  final HomeViewModel viewModel;

  // final PixabayApi api;
  //
  // final _photoStreamController = StreamController<List<Photo>>()..add([]);
  // Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  const PhotoProvider({
    Key? key,
    required Widget child,
    required this.viewModel,
  }) : super(key: key, child: child);

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result =
        context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }

  // Future<void> fetch(String query) async {
  //   final result = await api.fetch(query);
  //   _photoStreamController.add(result);
  // }

  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return true;
  }
}
