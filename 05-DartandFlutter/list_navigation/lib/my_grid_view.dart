import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GrideView'),
      ),
      body: Scrollbar(
        thickness: 10,
        thumbVisibility: true,
        radius: const Radius.circular(5),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: 30,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                debugPrint('Item $index Tapped');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Item $index tapped'),
                  ),
                );
              },
              child: Container(
                color: Colors.blue[100 * (index % 9)],
                child: Center(
                  child: Text('Item $index'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
