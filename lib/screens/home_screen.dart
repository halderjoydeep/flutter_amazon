import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    String catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    dynamic decodedData = jsonDecode(catalogJson);
    var productsData = decodedData['products'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amazon"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.phone_android),
                title: Text("List Item"),
                trailing: Icon(CupertinoIcons.cart_badge_plus),
              ),
            ),
          );
        },
      ),
      drawer: Drawer(),
    );
  }
}
