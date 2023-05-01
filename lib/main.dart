import 'package:dicodingproject_restaurantapp/resto_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      initialRoute: RestoList.routeName,
      routes: {
        RestoList.routeName: (context) => RestoList(),
      },
    );
  }
}
