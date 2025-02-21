import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'my_profile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionName = 'counters';
  final String _documentId = 'my_counter_id';

  void _incrementCounter() {
    _firestore.runTransaction((transaction) async {
      transaction.update(
        _firestore.collection(_collectionName).doc(_documentId),
        <String, dynamic>{'counter': FieldValue.increment(1)},
      );
    });

    // 트랜잭션을 사용하지 않고 업데이트하는 방법
    // 단순 업데이트 작업, 다른 동시 업데이트와 충돌 가능성 있음, 단일 문서 업데이트에 적합,
    // 더 간단하고 가벼운 작업
    // _firestore.collection(_collectionName).doc(_documentId).update({
    //   'counter': FieldValue.increment(1),
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const MyProfilePage();
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            StreamBuilder<DocumentSnapshot>(
              stream:
                  _firestore
                      .collection(_collectionName)
                      .doc(_documentId)
                      .snapshots(),
              builder: (
                BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot,
              ) {
                if (snapshot.hasError) {
                  debugPrint(snapshot.error.toString());
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (!snapshot.hasData) {
                  return const Text('Document does not exist');
                }
                final data = snapshot.data!.data() as Map<String, dynamic>;
                final counter = data['counter'] as int;
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
