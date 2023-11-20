import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shopping_list/bloc/grocery_bloc.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  late GroceryBloc _groceryBloc;
  final _formkey = GlobalKey<FormState>();
  var _enteredName = TextEditingController();
  var _enteredQuantity = 1;
  var _metricController = TextEditingController(text: metric[0]);
  var _selectedCategory = categories[Categories.vegetables]!;

  @override
  void initState() {
    _groceryBloc = GroceryBloc();
    super.initState();
  }

  @override
  void dispose() {
    _groceryBloc.close();
    super.dispose();
  }

  void _saveItem() async {
    final newItem = GroceryItem(
      id: DateTime.now().toIso8601String(),
      name: _enteredName.text.toString(),
      quantity: _enteredQuantity,
      category: Category(_selectedCategory.title, _selectedCategory.color,
          _selectedCategory.img),
    );

    _groceryBloc.add(AddDataEvent(newItem));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a New Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length == 2 ||
                      value.trim().length >= 50) {
                    return "Must be between 2 to 50 characters";
                  }
                  return value;
                },
                controller: _enteredName,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    // child: Row(
                    //   children: [
                    //     Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: _enteredQuantity.toString(),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return "Must be a positive number";
                        }
                      },
                      onSaved: (newValue) {
                        _enteredQuantity = int.parse(newValue!);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  // Expanded(
                  //   child: DropdownButtonFormField(
                  //       items: [
                  //         for (final met in metric)
                  //           DropdownMenuItem(value: met, child: Text(met))
                  //       ],
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _metricController =
                  //               value! as TextEditingController;
                  //         });
                  //       }),
                  // )
                  Expanded(
                    child: DropdownButtonFormField(
                        value: _selectedCategory,
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    height: 16,
                                    width: 16,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Text(category.value.title)
                                ],
                              ),
                            ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            _selectedCategory = value!;
                          });
                        }),
                  ),
                ],
                // ),
              ),
              const SizedBox(
                width: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formkey.currentState!.reset();
                    },
                    child: const Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: const Text("Add Item"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
