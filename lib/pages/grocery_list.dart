// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopping_list/bloc/grocery_bloc.dart';
// import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/pages/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  late List grolis;
  Box grocery_box = Hive.box('grocery_box');
  late GroceryBloc _groceryBloc;

  void navigateToNewItemPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((context) => const NewItem()),
      ),
    );
  }

  @override
  void initState() {
    _groceryBloc = GroceryBloc();
    grolis = grocery_box.values.toList();
    super.initState();
  }

  @override
  void dispose() {
    _groceryBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final grocery_box = Hive.box('grocery_box');

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[100],
          title: const Text("Your Groceries"),
          actions: [
            IconButton(
              onPressed: () {
                _groceryBloc.add(ClearBoxEvent());
              },
              icon: const Icon(Icons.clear),
              tooltip: 'Clear all entries',
            ),
            IconButton(
              onPressed: navigateToNewItemPage,
              icon: const Icon(Icons.add),
              tooltip: 'Add items',
            ),
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: grocery_box.listenable(),
          builder: (context, value, child) {
            grolis = grocery_box.values.toList();
            return grolis.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text('No Data'),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    reverse: true,
                    itemCount: grolis.length,
                    itemBuilder: (context, index) {
                      debugPrint('this is item ${grolis[index]}');
                      // debugPrint(grolis[index].id);

                      // debugPrint('this is index id  ${grolis[index]['id']}');
                      var data = grolis[index] as GroceryItem;

                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'assets/images/${grolis[index].category.img}')),
                                  shape: BoxShape.rectangle,
                                  // color: grolis[index].category.color,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${grolis[index].name}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    '${grolis[index].category.title}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: grolis[index].category.color,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Text('${grolis[index].quantity}'),
                              IconButton(
                                onPressed: () {
                                  _groceryBloc
                                      .add(DeleteDataEvent(grolis[index]));
                                },
                                icon: const Icon(Icons.delete),
                                color: const Color.fromARGB(255, 196, 64, 54),
                              ),
                            ],
                          ),
                        ),
                        // ListTile(
                        //   leading: Container(
                        //     color:grolis[index].category.color,
                        //     height: 24,
                        //     width: 24,
                        //   ),
                        //   title: Text(
                        //     '${grolis[index].name}',
                        //     // '',
                        //     style: const TextStyle(
                        //         fontWeight: FontWeight.bold, fontSize: 16),
                        //   ),
                        //   subtitle: Text(
                        //     '${grolis[index].quantity}',
                        //     // '',
                        //     style: const TextStyle(fontWeight: FontWeight.bold),
                        //   ),
                        //   trailing: IconButton(
                        //     onPressed: () {
                        //       _groceryBloc
                        //           .add(DeleteDataEvent(grolis[index]));
                        //     },
                        //     icon: const Icon(Icons.delete),
                        //     color: const Color.fromARGB(255, 196, 64, 54),
                        //   ),
                        // ),
                      );
                    });
          },
        ));
  }
}
