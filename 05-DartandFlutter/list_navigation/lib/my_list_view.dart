import 'package:flutter/material.dart';
import 'my_details.dart';

class ListDataItems {
  final List<String> monthItems = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
}

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    final ListDataItems item = ListDataItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.separated(
        itemCount: item.monthItems.length,
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(item.monthItems[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MyDetails(item.monthItems[index])));
              });
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
            indent: 16,
            endIndent: 4,
          );
        },
      ),
    );
  }
}
