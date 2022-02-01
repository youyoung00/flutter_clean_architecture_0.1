import 'package:clean_architecture/data/data_source/result.dart';
import 'package:clean_architecture/domain/model/photo.dart';
import 'package:clean_architecture/domain/repository/photo_api_repository.dart';
import 'package:clean_architecture/domain/use_case/get_photos_use_case.dart';
import 'package:clean_architecture/presentation/home/home_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('STREAM WORKING...', () async {
    final viewModel = HomeViewModel(GetPhotosUseCase(FakePhotoApiRepository()));

    await viewModel.fetch('apple');

    final result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.state.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));
    return Result.success(fakeJson.map((e) => Photo.fromJson(e)).toList());
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 256261,
    "pageURL":
        "https://pixabay.com/photos/apple-books-still-life-fruit-food-256261/",
    "type": "photo",
    "tags": "apple, books, still life",
    "previewURL":
        "https://cdn.pixabay.com/photo/2014/02/01/17/28/apple-256261_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g37e41a15aa94cc6c7c9501be8e333f57c2014baefd0396f14287c6934cab8be9770afc9941e9db3731b0e870dba911aa_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 423,
    "largeImageURL":
        "https://pixabay.com/get/g3e5030ffd8a607864cd99b3ebd107bb585432524242fac62c5e90c197be3320c135aa47e19a78f4233e802228d14d3ae2e3e3c88a4185aad99fe1937a2b52817_1280.jpg",
    "imageWidth": 4928,
    "imageHeight": 3264,
    "imageSize": 2987083,
    "views": 397731,
    "downloads": 189823,
    "collections": 3669,
    "likes": 977,
    "comments": 218,
    "user_id": 143740,
    "user": "jarmoluk",
    "userImageURL":
        "https://cdn.pixabay.com/user/2019/09/18/07-14-26-24_250x250.jpg"
  },
  {
    "id": 1122537,
    "pageURL":
        "https://pixabay.com/photos/apple-water-droplets-fruit-moist-1122537/",
    "type": "photo",
    "tags": "apple, water droplets, fruit",
    "previewURL":
        "https://cdn.pixabay.com/photo/2016/01/05/13/58/apple-1122537_150.jpg",
    "previewWidth": 150,
    "previewHeight": 95,
    "webformatURL":
        "https://pixabay.com/get/g87347a5cc8884c1e304ae53b7063b41596aac58357683cafb589a465a8279473d76eb04d63fe3ce033e66997b9cff9122f6400cc01acb506c5d23d6c86f89d16_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 409,
    "largeImageURL":
        "https://pixabay.com/get/g391b636caa5cde9a1d9ddec280d01fb3e715e88f227186eb2da7792343350e79a7ea30bfe4d536de103665bc3ea8ae9961d1ab79cbbd020f24e1930c946f6f0e_1280.jpg",
    "imageWidth": 4752,
    "imageHeight": 3044,
    "imageSize": 5213632,
    "views": 240433,
    "downloads": 135348,
    "collections": 3347,
    "likes": 1017,
    "comments": 158,
    "user_id": 1445608,
    "user": "mploscar",
    "userImageURL":
        "https://cdn.pixabay.com/user/2016/01/05/14-08-20-943_250x250.jpg"
  },
];
