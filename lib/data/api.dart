import 'dart:convert';

import 'package:clean_architecture/model/photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi {
  final baseUrl = 'https://pixabay.com/api/';
  final key = '24806198-1f9550a3fd92fcce8b0067dc7';

  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo&pretty=true'),
    );
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
