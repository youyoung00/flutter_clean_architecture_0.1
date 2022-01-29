import 'package:clean_architecture/data/data_source/pixabay_api.dart';
import 'package:clean_architecture/domain/model/photo.dart';
import 'package:clean_architecture/domain/repository/photo_api_repository.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  // static const baseUrl = 'https://pixabay.com/api/';
  // static const key = '24806198-1f9550a3fd92fcce8b0067dc7';

  @override
  Future<List<Photo>> fetch(String query) async {
    final result = await api.fetch(query);
    // client ??= http.Client();

    // final response = await client.get(
    //   Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo&pretty=true'),
    // );
    // Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // Iterable hits = jsonResponse['hits'];
    return result.map((e) => Photo.fromJson(e)).toList();
  }
}
