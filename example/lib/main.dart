import 'package:flutter/material.dart';
import 'package:flutter_smart/flutter_smart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        body: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                SpUtils.putObject("key", "哈哈哈哈哈");
                print(SpUtils.getString("key"));
              },
              child: Text("国际化"),
            ),
          ],
        ),
      ),
    );
  }
}
