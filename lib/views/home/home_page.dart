import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:linkedin_clone/constants/constants.dart';
import 'package:linkedin_clone/helpers/data_helper.dart';
import 'package:linkedin_clone/models/post.dart';
import 'package:linkedin_clone/views/home/post_card.dart';
import 'package:linkedin_clone/views/messages/messages_page.dart';
import 'package:linkedin_clone/widgets/custom_drawer.dart';
import 'package:linkedin_clone/widgets/custom_sliver_appbar.dart';

class HomePage extends StatefulWidget {
  // scroll page callback
  final Function(ScrollDirection) onScroll;
  const HomePage({super.key, required this.onScroll});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // global key for drawer, can manage from everywhere easily
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // for scroll actions
  final ScrollController _scrollController = ScrollController();

  // post list
  late List<Post> myPostList = [];

  @override
  void initState() {
    super.initState();

    // scrolling actions for bottom navigation bar visibility
    _scrollController.addListener(() {
      widget.onScroll(_scrollController.position.userScrollDirection);
    });
    // get post data from data helper
    myPostList = DataHelper.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.bgPageColor,
        // global key
        key: _scaffoldKey,
        // Drawer
        drawer: CustomDrawer(),
        body: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // custom sliver appbar
            CustomSliverAppBar(
              // callback function
              onProfileTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              // callback function
              onMessageTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => MessagesPage()));
              },
            ),
            // Posts listesi
            SliverToBoxAdapter(
              child: ListView.builder(
                itemCount: myPostList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PostCard(post: myPostList[index]);
                },
                physics: const NeverScrollableScrollPhysics(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
