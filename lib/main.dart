import 'package:flutter/material.dart';
import 'package:newsapp/screen/main.dart';
import 'package:newsapp/viewmodel/listviewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => ListViewModel(),
          ),
        ],
        child: const NewsScreen(),
      ),
    );
  }
}
