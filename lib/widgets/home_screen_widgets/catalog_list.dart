import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_amazon/models/catalog_model.dart';
import 'package:flutter_amazon/utils/routes.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final Item item = CatalogModel.items![index];
        return InkWell(
          borderRadius: BorderRadius.circular(30),
          child: _CatalogItem(item: item),
          onTap: () {
            Navigator.pushNamed(context, MyRoutes.productDetailsRoute);
          },
        );
      },
    );
  }
}

class _CatalogItem extends StatelessWidget {
  final Item item;

  const _CatalogItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 30 / 100,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(item.image),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item.name,
                  textScaleFactor: 1.25,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Text(
                  item.desc,
                  style: Theme.of(context).textTheme.caption,
                ),
                SizedBox(height: 10),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    Text(
                      "\$${item.price}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textScaleFactor: 1.3,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(
                        CupertinoIcons.cart_badge_plus,
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
