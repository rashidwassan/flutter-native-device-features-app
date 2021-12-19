import 'package:flutter/material.dart';
import 'package:flutter_native_features/places_list_screen.dart';
import 'package:provider/provider.dart';
import './providers/great_places.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // wrapping whole widget tree with change notifier provider to get access to value.
    return ChangeNotifierProvider.value(
      value: GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const PlacesListScreen(),
      ),
    );
  }
}
