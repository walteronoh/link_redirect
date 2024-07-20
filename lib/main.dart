import 'package:flutter/material.dart';
import 'package:link_redirect/homepage.dart';
import 'package:link_redirect/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UniLinksService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: ContextUtility.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: "Flutter Demo Home Page")
    );
  }
}
