import 'package:ennachat_redwan_ecom_app/Style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../APIs/get_products.dart';
import './app_container.dart';

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
    Navigator.of(context).pushReplacementNamed(AppContainer.routeName);
  }

  @override
  void initState() {
    waitData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: SpinKitChasingDots(
          color: Style.primaryColor,
          size: 50.0,
        ),
      ),
    );
  }
}
