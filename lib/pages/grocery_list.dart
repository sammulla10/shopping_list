import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/pages/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final Stream<QuerySnapshot> _groceryStream =
      FirebaseFirestore.instance.collection('grocery_items').snapshots();
  List<GroceryItem> grocery_list = [];

  Future delete_item(documentId,docName) async {
    await FirebaseFirestore.instance
        .collection('grocery_items')
        .doc(documentId)
        .delete();
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Successfully deleted ${docName}"),duration: Duration(seconds: 3),
      ),
    );
  }

  void navigateToNewItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => NewItem())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[100],
        title: Text("Your Groceries"),
        actions: [
          IconButton(onPressed: navigateToNewItem, icon: Icon(Icons.add)),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _groceryStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong ${snapshot.error}');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Card(
                    color: Theme.of(context).copyWith().cardColor,
                    child: ListTile(
                      leading: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(data['category']['color']),
                        ),
                      ),
                      title: Text(
                        data['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      subtitle: Text(
                        '${data['quantity']}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          delete_item(data['id'],data['name']);
                        },
                        icon: Icon(Icons.delete),
                        color: Color.fromARGB(255, 196, 64, 54),
                      ),
                    ),
                  );
                }).toList(),
              );

              //  return ListView.builder(
              //   itemCount: snapshot.data!.docs.length ,
              //   itemBuilder: (context,index){
              //     return  Dismissible(
              //     key: ValueKey(_groceryStream),
              //     onDismissed: (direction) {},
              //     child: ListTile(
              //       leading: Container(
              //         color: snapshot.data!.docs[index].category.color,
              //         height: 24,
              //         width: 24,
              //       ),
              //       title: Text(_groceryStream[index].name),
              //       trailing: Text(_groceryStream[index].quantity.toString()),
              //     );
              //     });
            }
            return CircularProgressIndicator();
          }),
    );
  }
}
