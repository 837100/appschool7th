import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('MyAweomeTabBar'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home, color: Colors.white),
                  child: Text(
                    'Home',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.account_balance, color: Colors.white),
                  child: Text(
                    'Account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.calculate, color: Colors.white),
                  child: Text(
                    'Payments',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.credit_score, color: Colors.white),
                  child: Text(
                    'Card',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              SizedBox(child: Center(child: Text('Home page Tab 1'))),
              SizedBox(child: Center(child: Text('Account Page Tab 2'))),
              SizedBox(child: Center(child: Text('Payments Page Tab 3'))),
              SizedBox(child: Center(child: Text('Payments Page Tab 4'))),
            ],
          ),
        ),
      ),
    );
  }
}
