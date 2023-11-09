import 'package:flutter/material.dart';

class HomeDashboadChef extends StatefulWidget {
  const HomeDashboadChef({Key? key}) : super(key: key);

  @override
  createState() => _HomeDashboadChefState();
}

class _HomeDashboadChefState extends State<HomeDashboadChef> {
  int _selectedTabIndex = 0;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData(
        useMaterial3: true,
        brightness: isDark ? Brightness.dark : Brightness.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  // Thực hiện các hành động khi nhấn nút back
                  Navigator.of(context).pop();
                },
              ),
              title: const Text(
                'Chef Store',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              centerTitle: true,
              bottom: TabBar(
                onTap: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
                indicator: BoxDecoration(
                  color: Colors.black, // Màu nền của tab khi được chọn
                  borderRadius: BorderRadius.circular(30),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      'Campaign',
                      style: TextStyle(
                        color:
                            _selectedTabIndex == 0 ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Delivery',
                      style: TextStyle(
                        color:
                            _selectedTabIndex == 1 ? Colors.white : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                Container(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SearchAnchor(builder: (BuildContext context,
                              SearchController controller) {
                            return SearchBar(
                              controller: controller,
                              padding:
                                  const MaterialStatePropertyAll<EdgeInsets>(
                                      EdgeInsets.symmetric(horizontal: 16.0)),
                              onTap: () {
                                controller.openView();
                              },
                              onChanged: (_) {
                                controller.openView();
                              },
                              leading: const Icon(Icons.search),
                              trailing: <Widget>[
                                Tooltip(
                                  message: 'Change brightness mode',
                                  child: IconButton(
                                    isSelected: isDark,
                                    onPressed: () {
                                      setState(() {
                                        isDark = !isDark;
                                      });
                                    },
                                    icon: const Icon(Icons.campaign),
                                    selectedIcon:
                                        const Icon(Icons.brightness_2_outlined),
                                  ),
                                )
                              ],
                            );
                          }, suggestionsBuilder: (BuildContext context,
                              SearchController controller) {
                            return List<ListTile>.generate(5, (int index) {
                              final String item = 'item $index';
                              return ListTile(
                                title: Text(item),
                                onTap: () {
                                  setState(() {
                                    controller.closeView(item);
                                  });
                                },
                              );
                            });
                          }),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(16.0),
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '3 items',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Campaign 1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        '#264100',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Now',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: null,
                                        child: Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        onPressed: null,
                                        child: Text('Details'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: 6, // Đặt số lượng item tại đây
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SearchAnchor(builder: (BuildContext context,
                              SearchController controller) {
                            return SearchBar(
                              controller: controller,
                              padding:
                                  const MaterialStatePropertyAll<EdgeInsets>(
                                      EdgeInsets.symmetric(horizontal: 16.0)),
                              onTap: () {
                                controller.openView();
                              },
                              onChanged: (_) {
                                controller.openView();
                              },
                              leading: const Icon(Icons.search),
                              trailing: <Widget>[
                                Tooltip(
                                  message: 'Change brightness mode',
                                  child: IconButton(
                                    isSelected: isDark,
                                    onPressed: () {
                                      setState(() {
                                        isDark = !isDark;
                                      });
                                    },
                                    icon: const Icon(Icons.campaign),
                                    selectedIcon:
                                        const Icon(Icons.brightness_2_outlined),
                                  ),
                                )
                              ],
                            );
                          }, suggestionsBuilder: (BuildContext context,
                              SearchController controller) {
                            return List<ListTile>.generate(5, (int index) {
                              final String item = 'item $index';
                              return ListTile(
                                title: Text(item),
                                onTap: () {
                                  setState(() {
                                    controller.closeView(item);
                                  });
                                },
                              );
                            });
                          }),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(16.0),
                              padding: const EdgeInsets.all(16.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '3 items',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Campaign 1',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        '#264100',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Now',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: null,
                                        child: Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        onPressed: null,
                                        child: Text('Details'),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          childCount: 2, // Đặt số lượng item tại đây
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
