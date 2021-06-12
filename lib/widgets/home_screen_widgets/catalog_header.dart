import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Amazon",
          textScaleFactor: 3,
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Trending products",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Theme.of(context).accentColor,
          ),
        ),
      ],
    );
  }
}
