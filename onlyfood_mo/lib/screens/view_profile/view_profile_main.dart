import 'package:flutter/material.dart';
import 'package:onlyfood_mo/screens/view_profile/profile.dart';

class ViewProfileMain extends StatefulWidget {
  const ViewProfileMain({Key? key}) : super(key: key);

  @override
  createState() => _ViewProfileMainState();
}

class _ViewProfileMainState extends State<ViewProfileMain> {
  @override
  Widget build(BuildContext context) {
    return MyProfile();
  }
}

class MyProfile extends StatelessWidget {
  List<String> posts = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
    'assets/images/9.png',
    'assets/images/10.png',
    'assets/images/11.png',
    'assets/images/12.png',
    'assets/images/13.png',
    'assets/images/14.png',
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.png',
    'assets/images/6.png',
    'assets/images/7.png',
    'assets/images/8.png',
    'assets/images/9.png',
    'assets/images/10.png',
    'assets/images/11.png',
    'assets/images/12.png',
    'assets/images/13.png',
    'assets/images/14.png',
  ];

  MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, isScolled) {
              return [
                const SliverAppBar(
                  backgroundColor: Colors.white,
                  collapsedHeight: 330,
                  expandedHeight: 250,
                  flexibleSpace: Profile(),
                ),
                SliverPersistentHeader(
                  delegate: MyDelegate(const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.grid_on)),
                      Tab(icon: Icon(Icons.storefront)),
                    ],
                    indicatorColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                  )),
                  floating: true,
                  pinned: true,
                )
              ];
            },
            body: TabBarView(
              children: [1, 2]
                  .map((tab) => GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        mainAxisSpacing: 2.0,
                        crossAxisSpacing: 2.0,
                        children: posts
                            .map((e) => Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(e),
                                          fit: BoxFit.fill)),
                                ))
                            .toList(),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);
  final TabBar tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
