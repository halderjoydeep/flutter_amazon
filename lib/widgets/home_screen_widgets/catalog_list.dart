import 'package:flutter/material.dart';

import 'package:flutter_amazon/models/catalog_model.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final Item item = CatalogModel.items![index];
        return _CatalogItem(item: item);
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
        ],
      ),
    );
  }
}
