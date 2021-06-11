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
        backgroundColor: Colors.transparent,
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
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple,
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/594610/pexels-photo-594610.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                    ),
                  ),
                  accountName: Text(
                    "Dragon Warrior",
                    textScaleFactor: 1.5,
                  ),
                  accountEmail: Text(
                    "dragonwarrior57@gmail.com",
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.2,
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.2,
                ),
              ),
              ListTile(
                leading: Icon(
                  CupertinoIcons.mail,
                  color: Colors.white,
                ),
                title: Text(
                  "Email us",
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
