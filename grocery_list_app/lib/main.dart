import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/grocery_bloc.dart';
import 'screens/grocery_list_screen.dart';
import 'bloc/grocery_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;

  MyApp({required this.prefs});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroceryBloc(prefs: prefs)..add(LoadGroceries()),
      child: MaterialApp(
        title: 'Grocery List App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GroceryListScreen(),
      ),
    );
  }
}
