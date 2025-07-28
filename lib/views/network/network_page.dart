import 'package:flutter/material.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/views/messages/messages_page.dart';
import 'package:linkedin_clone/views/network/network_buyut.dart';
import 'package:linkedin_clone/views/network/network_haberler.dart';
import 'package:linkedin_clone/widgets/custom_drawer.dart';
import 'package:linkedin_clone/widgets/custom_sliver_appbar.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  // global key for drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // there is tabbar so started with DefaultTabController
    return SafeArea(
      child: DefaultTabController(
        // tab count
        length: 2,
        child: Scaffold(
          drawer: CustomDrawer(),
          key: _scaffoldKey,
          backgroundColor: Constants.bgPageColor,
          body: NestedScrollView(
            headerSliverBuilder:
                (context, innerBoxIsScrolled) => [
                  // sliver appbar, will be invisible while scrolling
                  CustomSliverAppBar(
                    onProfileTap: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    onMessageTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MessagesPage()),
                      );
                    },
                  ),

                  // tabbar will be sticky while scrolling
                  SliverPersistentHeader(
                    pinned: true, // to be sticky
                    // created tabbar and used _TabbarDelegate
                    delegate: _TabBarDelegate(
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: Constants.tabbarSelectedLabelColor,
                        labelStyle: TextStyle(
                          fontSize: Constants.tabbarFontsize,
                          fontWeight: Constants.tabbarLabelWeight,
                        ),
                        unselectedLabelColor: Constants.mainDarkGreyColor,
                        indicatorColor: Constants.mainGreenColor,
                        tabs: [
                          Tab(text: "Büyüt"),
                          Tab(text: "Ağınızdan haberler"),
                        ],
                      ),
                    ),
                  ),
                ],
            body: SafeArea(
              child: TabBarView(children: [NetworkBuyut(), NetworkHaberler()]),
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar; // The TabBar widget to be pinned at the top

  _TabBarDelegate(this._tabBar); // Constructor to receive the TabBar

  @override
  double get minExtent => _tabBar.preferredSize.height; // Minimum height equals TabBar's height

  @override
  double get maxExtent => _tabBar.preferredSize.height; // Maximum height also equals TabBar's height

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white, // Background color of the pinned header
      child: _tabBar, // Display the TabBar
    );
  }

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return false; // No need to rebuild unless the TabBar changes
  }
}
