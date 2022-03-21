import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../Style/style.dart';
import '../Widgets/products_overview.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Providers/products.dart';

class AppContainer extends StatefulWidget {
  const AppContainer({Key? key}) : super(key: key);

  static const routeName = '/Products';

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  final _iconsList = <IconData>[
    Icons.shopping_cart,
    Icons.credit_card,
  ];

  int _index = 0;
  //bool _appMode = false;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Products())],
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Style.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: RotatedBox(
            quarterTurns: 1,
            child: IconButton(
              icon: Icon(
                Icons.bar_chart_rounded,
                size: 40,
                color: Style.textColor,
              ),
              onPressed: () {
                if (_scaffoldKey.currentState!.isDrawerOpen) {
                  _scaffoldKey.currentState!.openEndDrawer();
                } else {
                  _scaffoldKey.currentState!.openDrawer();
                }
              },
            ),
          ),
          actions: const [
            // IconButton(
            //   onPressed: () {
            //     setState(() {
            //       _appMode = !_appMode;
            //       _appMode ? st.darkMode() : st.lightMode();
            //     });
            //   },
            //   icon: Icon(
            //     _appMode ? Icons.dark_mode : Icons.light_mode,
            //     size: 40,
            //     color: Style.textColor,
            //   ),
            // )
          ],
        ),
        drawer: Drawer(
            child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ennachat Shop',
                  style: TextStyle(
                    color: Style.primaryColor,
                    fontSize: 30,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: IconButton(
                    icon: FaIcon(
                      FontAwesomeIcons.store,
                      color: Style.primaryColor,
                      size: 35,
                    ),
                    onPressed: () {},
                  ),
                  title: const Text(
                    'Shop',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Style.primaryColor,
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  title: const Text(
                    'Cart',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(
                      Icons.credit_card,
                      color: Style.primaryColor,
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  title: const Text(
                    'Orders',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        )),
        body: const ProductsOverview(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const FaIcon(
            FontAwesomeIcons.store,
            color: Colors.white,
          ),
          backgroundColor: Style.primaryColor,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          icons: _iconsList,
          activeIndex: _index,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.smoothEdge,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          backgroundColor: Style.primaryColor,
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          onTap: (i) {
            setState(() {
              _index = i;
            });
          },
        ),
      ),
    );
  }
}
