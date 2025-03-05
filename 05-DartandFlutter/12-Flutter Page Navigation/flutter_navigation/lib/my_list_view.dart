import 'package:flutter/material.dart';

import 'my_details.dart';

class MyListView extends StatelessWidget {
  final String title;
  const MyListView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyDetails(itemTitle: title)),
        );
      },
    );
  }
}
