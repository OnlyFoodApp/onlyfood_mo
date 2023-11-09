import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black, size: 25),
        backgroundColor: Colors.white,
        title: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
                prefix: Icon(
                  Icons.search,
                  size: 20,
                ),
                hintStyle: TextStyle(color: Colors.grey)),
          ),
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(
              right: 20,
            ),
            child: Icon(Icons.camera_alt),
          )
        ],
        toolbarHeight: kToolbarHeight + 10.0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 30,
              margin: EdgeInsets.only(top: 5, bottom: 5),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _tagItem("Account"),
                  _tagItem("Post"),
                  _tagItem("Campaign"),
                ],
              ),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            children: List.generate(14, (int index) {
              int remain = index % 14;

              if (remain == 1 || remain == 2) {
                // Return StaggeredGridTile.count for the specified indices
                return StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: _gridItem(index),
                );
              } else {
                // Return the widget for other indices
                return StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: _gridItem(index),
                );
              }
            }),
          )
        ],
      ),
    );
  }

  Widget _tagItem(String title) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    );
  }

  Widget _gridItem(int i) {
    return Image.asset(
      'assets/images/$i.png',
      fit: BoxFit.fill,
    );
  }
}
