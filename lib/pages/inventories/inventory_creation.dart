import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:arocs_controller/models/Inventories/inventory.dart';

class InventoryCreation extends StatefulWidget {
  const InventoryCreation({super.key});

  @override
  State<InventoryCreation> createState() => _InventoryCreationState();
}

class _InventoryCreationState extends State<InventoryCreation> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }
  
  @override
  Widget build(BuildContext context) {
     return AlertDialog(
      title: const Text("Create New Item"),
      content: SizedBox(
        height: 100,
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Item Name',
                labelStyle: TextStyle(),  
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text("Create"),
          onPressed: () {
            context.read<InventoryBloc>().add(InventoryCreationEvent(newItem: InventoryModel(itemUID: const Uuid().v4(), itemName: _nameController.text, itemCount: 0)));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}