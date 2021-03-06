import 'package:ennachat_redwan_ecom_app/Style/style.dart';
import 'package:flutter/material.dart';

import './Screens/loading.dart';
import './Screens/app_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ennachat Redwan Shop',
      theme: ThemeData(
        primaryColor: Style.primaryColor,
        fontFamily: 'Fredoka',
      ),
      initialRoute: Loading.routeName,
      routes: {
        Loading.routeName: (_) => const Loading(),
        AppContainer.routeName: (_) => const AppContainer(),
      },
    );
  }
}
