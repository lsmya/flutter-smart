import 'package:flutter/material.dart';
import 'package:flutter_smart/flutter_smart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 初始化SpUtils
  await SpUtils.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(child: Text("MAIN")),
      ),
    );
  }
}
