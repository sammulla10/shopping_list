//  import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_list/models/category.dart';
import 'package:shopping_list/models/grocery_item.dart';
// import 'package:shopping_list/firebase_options.dart';
import 'package:shopping_list/pages/grocery_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.registerAdapter(GroceryItemAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ColorAdapter());
  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  Hive.init(dir.path);
  await Hive.openBox('grocery_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: GroceryList(),
    );
  }
}
