import 'package:flutter/material.dart';

import './Screens/loading.dart';
import './Screens/products_overview.dart';
import './APIs/get_products.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      initialRoute: Loading.routeName,
      routes: {
        Loading.routeName: (_) => const Loading(),
        ProductsScreen.routeName: (_) => const ProductsScreen()
      },
    );
  }
}
