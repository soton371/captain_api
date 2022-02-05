import 'package:captain_api/constant.dart';
import 'package:captain_api/views/cart/cart_screen.dart';
import 'package:captain_api/views/home/home_screen.dart';
import 'package:captain_api/views/profile/profile_screen.dart';
import 'package:captain_api/views/sale/sale_screen.dart';
import 'package:captain_api/views/search/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FullAppScreen extends StatefulWidget {
  const FullAppScreen({Key? key}) : super(key: key);

  @override
  _FullAppScreenState createState() => _FullAppScreenState();
}

class _FullAppScreenState extends State<FullAppScreen> with SingleTickerProviderStateMixin{

  int _currentIndex = 0;

  TabController? _tabController;

  _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController!.index;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController!.addListener(_handleTabSelection);
    _tabController!.animation!.addListener(() {
      final aniValue = _tabController!.animation!.value;
      if (aniValue - _currentIndex > 0.5) {
        setState(() {
          _currentIndex = _currentIndex + 1;
        });
      } else if (aniValue - _currentIndex < -0.5) {
        setState(() {
          _currentIndex = _currentIndex - 1;
        });
      }
    });
    super.initState();
  }

  onTapped(value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          child: Container(
            decoration: BoxDecoration(
              color: ColorConfig.background,
              boxShadow: [
                BoxShadow(
                  color: ColorConfig.shadowColor.withAlpha(40),
                  blurRadius: 3,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: TabBar(
              controller: _tabController,
              indicator: const BoxDecoration(),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: ColorConfig.primary,
              tabs: <Widget>[
                Container(
                  child: (_currentIndex == 0)
                      ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(MdiIcons.store,color: ColorConfig.primary,),
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        decoration: BoxDecoration(
                            color: ColorConfig.primary,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(2.5))),
                        height: 5,
                        width: 5,
                      )
                    ],
                  )
                      : Icon(MdiIcons.storeOutline,color: ColorConfig.onBackground,),
                ),
                Container(
                    margin: const EdgeInsets.only(right: 24),
                    child: (_currentIndex == 1)
                        ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(MdiIcons.magnify,color: ColorConfig.primary,),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                              color: ColorConfig.primary,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(2.5))),
                          height: 5,
                          width: 5,
                        )
                      ],
                    )
                        : Icon(MdiIcons.magnify,color: ColorConfig.onBackground,)),
                Container(
                    margin: const EdgeInsets.only(left: 24),
                    child: (_currentIndex == 2)
                        ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(MdiIcons.tag,color: ColorConfig.primary,),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                              color: ColorConfig.primary,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(2.5))),
                          height: 5,
                          width: 5,
                        )
                      ],
                    )
                        : Icon(MdiIcons.tagOutline,color: ColorConfig.onBackground,)),
                Container(
                    child: (_currentIndex == 3)
                        ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(MdiIcons.account,color: ColorConfig.primary,),
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                              color: ColorConfig.primary,
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(2.5))),
                          height: 5,
                          width: 5,
                        )
                      ],
                    )
                        : Icon(MdiIcons.accountOutline,color: ColorConfig.onBackground,)),
              ],
            ),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const CartScreen();
            }),
          );
        },
        child: Icon(
          MdiIcons.cartOutline,
          color: ColorConfig.primary,
        ),
        backgroundColor: Colors.grey.shade100,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          HomeScreen(),
          const SearchScreen(),
          const SaleScreen(),
          const ProfileScreen()
        ],
      ),
    );
  }
}
