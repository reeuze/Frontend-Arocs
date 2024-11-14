import 'package:flutter/material.dart';

import 'package:arocs_controller/models/Inventories/inventory.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({super.key, required this.item});
  final InventoryModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Product Id:      ..${item.itemUID.split("-").last}'
            ),
          ),
          ListTile(
            title: Text(
              'Product Name:    ${item.itemName}'
            ),
          ),
          ListTile(
            title: Text(
              "Product Count:   ${item.itemCount}"
            ),
          )
        ],
      ),
    );
  }
}