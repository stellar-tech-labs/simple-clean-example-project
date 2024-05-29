import 'package:flutter/material.dart';
import 'package:get_api/dependency_injection.dart';
import 'package:get_api/src/posts/presentation/fetch_data_page.dart';

void main() {
  initGetIt();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FetchDataPage(),
    );
  }
}
