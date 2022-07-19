import 'package:flutter/material.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/fav_screen.dart';
import 'package:meals_app/widget/main_drawer.dart';

class TabScreen extends StatefulWidget {
  final List favMeal;
  const TabScreen(this.favMeal, {Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late final List _pages;
  int _selectedPage = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {"page": const CatagoriesScreen(), "title": "Category"},
      {"page": FavScreen(widget.favMeal), "title": "Your Favourite"},
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // DefaultTabController(
        // initialIndex: 0,
        // length: 2,
        // child:
        Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: Text(
          _pages[_selectedPage]["title"],
        ),
        // bottom: const TabBar(tabs: [
        //   Tab(
        //     icon: Icon(Icons.category),
        //     child: Text("Category"),
        //   ),
        //   Tab(
        //     icon: Icon(Icons.star),
        //     child: Text("Favourite"),
        //   )
        // ]),
      ),
      body: _pages[_selectedPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black54,
          selectedItemColor: Colors.black,
          currentIndex: _selectedPage,
          onTap: _selectPage,
          backgroundColor: Theme.of(context).primaryColor,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: const Icon(Icons.category),
              // title: const Text("Category"),
              // ignore: prefer_const_constructors
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.star),
              // title: Text("Favourite"),
            ),
          ]),
    );
  }
}
