import 'package:clean_architecture/domain/model/photo.dart';

class HomeState {
  List<Photo> photos;
  bool isLoading;

  HomeState(this.photos, this.isLoading);
}
