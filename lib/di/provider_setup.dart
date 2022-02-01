import 'package:clean_architecture/data/data_source/pixabay_api.dart';
import 'package:clean_architecture/data/repository/photo_api_repository_impl.dart';
import 'package:clean_architecture/domain/repository/photo_api_repository.dart';
import 'package:clean_architecture/domain/use_case/get_photos_use_case.dart';
import 'package:clean_architecture/presentation/home/home_view_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// 1. Provider 전체
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

// 2. 독립적인 객체. 다른 클래스에 의존하지 않는 Model.
List<SingleChildWidget> independentModels = [
  Provider<http.Client>(
    create: (context) => http.Client(),
  )
];

// 3. 2번 객체에 의존성 있는 객체. 2에 등록한 클래스에 의존하는 Model.
List<SingleChildWidget> dependentModels = [
  ProxyProvider<http.Client, PixabayApi>(
    update: (context, client, _) => PixabayApi(client),
  ),
  ProxyProvider<PixabayApi, PhotoApiRepository>(
    update: (context, api, _) => PhotoApiRepositoryImpl(api),
  ),
  ProxyProvider<PhotoApiRepository, GetPhotosUseCase>(
    update: (context, repository, _) => GetPhotosUseCase(repository),
  ),
];

// 4. ViewModels
// View 가 사용. 2, 3에 등록한 클래스를 사용할 수 있음.
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(context.read<GetPhotosUseCase>()),
  ),
];
