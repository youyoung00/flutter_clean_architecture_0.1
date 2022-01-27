import 'package:clean_architecture/data/photo_provider.dart';
import 'package:clean_architecture/ui/home_screen.dart';
import 'package:clean_architecture/ui/home_view_model.dart';
import 'package:flutter/material.dart';

import 'data/pixabay_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhotoProvider(
        viewModel: HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
