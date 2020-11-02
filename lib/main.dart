import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_small_application/ui/view/register_view.dart';

final debug = false;

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Simple App',
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.blue,
          ),
          home: RegisterView(),
        );
  }
}
