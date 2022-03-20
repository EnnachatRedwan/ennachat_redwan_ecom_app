import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../APIs/get_products.dart';
import './products_overview.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);
  static const routeName = '/Loading';

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void waitData() async {
    var prdp = ProductsProvider();
    await prdp.getProducts();
    Navigator.of(context).pushReplacementNamed(ProductsScreen.routeName);
  }

  @override
  void initState() {
    waitData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
