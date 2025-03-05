import 'package:flutter/material.dart';

final List<Widget> _navigationPages = [
  const Center(child: Text('Page: Home')),
  const Center(child: Text('Page: News')),
  const Center(child: Text('Page: Favorites')),
  const Center(child: Text('Page: List')),
];

class MyBottomNavigationWidget extends StatefulWidget {
  const MyBottomNavigationWidget({super.key});

  @override
  State<MyBottomNavigationWidget> createState() =>
      _MyBottomNavigationWidgetState();
}

class _MyBottomNavigationWidgetState extends State<MyBottomNavigationWidget> {
  int _itemSelected = 0;

  void _bottomBarNavigation(int index) {
    setState(() {
      _itemSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bottom Navigation Bar')),
      body: _navigationPages[_itemSelected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _itemSelected,
        onTap: _bottomBarNavigation,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'News'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        ],
      ),
    );
  }
}
