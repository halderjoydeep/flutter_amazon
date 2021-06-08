import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_amazon/models/catalog_model.dart';

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
    final String catalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData['products'];
    CatalogModel.items =
        List.of(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amazon"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: CatalogModel.items!.length,
        itemBuilder: (context, index) {
          final item = CatalogModel.items![index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Card(
              child: ListTile(
                contentPadding: EdgeInsets.all(16),
                leading: Image.network(
                  item.image,
                  width: 100,
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name),
                    Text(
                      item.desc,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                trailing: Text(
                  "\$${item.price.toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Theme.of(context).buttonColor),
                ),
              ),
            ),
          );
        },
      ),
      drawer: Drawer(),
    );
  }
}
