import 'package:flutter/material.dart';
import 'package:flutter_smart/flutter_smart.dart';

class Page1 extends StatefulWidget {
  const Page1._();

  static final route = "/page1";

  static dynamic createRouter() {
    return AppRouter.createRoute(route, child: Page1._());
  }

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text("Page1 内容"),
      ),
    );
  }
}