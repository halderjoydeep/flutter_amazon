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
      body: GridView.builder(
          padding: const EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: CatalogModel.items!.length,
          itemBuilder: (context, index) {
            final Item item = CatalogModel.items![index];
            return Card(
              child: GridTile(
                header: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    item.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                footer: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  color: Theme.of(context).buttonColor,
                  child: Text(
                    "\$${item.price}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(32),
                  child: Image.network(
                    item.image,
                  ),
                ),
              ),
            );
          }),
      drawer: Drawer(),
    );
  }
}
