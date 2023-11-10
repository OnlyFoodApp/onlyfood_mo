import 'package:flutter/material.dart';
import 'package:onlyfood_mo/screens/view_profile/profile.dart';

class SearchCampaignByFilterChef extends StatefulWidget {
  const SearchCampaignByFilterChef({Key? key}) : super(key: key);

  @override
  createState() => _SearchCampaignByFilterChefState();
}

class _SearchCampaignByFilterChefState
    extends State<SearchCampaignByFilterChef> {
  @override
  Widget build(BuildContext context) {
    return ChefProfile();
  }
}

class ChefProfile extends StatelessWidget {
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

  ChefProfile({super.key});

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
            children: [
              // First tab (GridView)
              GridView.count(
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
                              fit: BoxFit.fill,
                            ),
                          ),
                        ))
                    .toList(),
              ),
              // Second tab with search bar and filter buttons
              ListView(
                children: [
                  Column(
                    children: [
                      // Search Bar
                      Container(
                        margin: const EdgeInsets.only(
                            top: 10.0, bottom: 0.0, left: 30.0, right: 30.0),
                        child: TextField(
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Search...',
                            hintStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            prefixIcon: const Icon(Icons.search),
                            prefixIconColor: Colors.black,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 15.0), // Adjust padding
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust border radius
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Adjust border radius
                            ),
                          ),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0,
                                  left: 30.0), // Adjust the right margin
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  overlayColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 237, 228, 228)),
                                  side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(color: Colors.black)),
                                ),
                                child: const Text(
                                  'Filter 1',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal:
                                      8.0), // Adjust the space between buttons
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  overlayColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 237, 228, 228)),
                                  side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(color: Colors.black)),
                                ),
                                child: const Text(
                                  'Filter 2',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 30), // Adjust the left margin
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black),
                                  overlayColor: MaterialStateProperty.all<
                                          Color>(
                                      const Color.fromARGB(255, 237, 228, 228)),
                                  side: MaterialStateProperty.all<BorderSide>(
                                      const BorderSide(color: Colors.black)),
                                ),
                                child: const Text(
                                  'Filter 3',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GridView.count(
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
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
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
