import 'package:flutter/material.dart';
import 'package:flutter_smart/flutter_smart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 初始化SpUtils
  await SpUtils.init();
  RouterUtils.init(
    routes: [RouterUtils.createRoute(path: '/', child: const HomePage())],
  );
  runApp(ScreenAdapterUtils.init(child: const MyApp()));
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
    return MaterialApp.router(
      routerConfig: RouterUtils.goRouter,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      title: 'Flutter Smart Demo',
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with EventBusMixin {
  String _eventMessage = '暂无事件';
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();

    // 订阅事件
    subscribe<CounterEvent>((event) {
      setState(() {
        _eventMessage = '收到事件：计数器 = ${event.count}';
      });
    });
  }

  void _loadCounter() async {
    setState(() {
      _counter = SpUtils.getInt('counter', defValue: 0);
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    SpUtils.putInt('counter', _counter);
    // 发送事件
    EventBusUtils.sendEvent(CounterEvent(_counter));
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
    SpUtils.putInt('counter', 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Smart Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.px),
        children: [
          // 1. 屏幕适配示例
          _buildSection(
            title: '1. 屏幕适配',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '屏幕宽度：${ScreenUtils.screenWidth.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 8.px),
                Text(
                  '屏幕高度：${ScreenUtils.screenHeight.toStringAsFixed(0)}',
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 8.px),
                Container(
                  width: 100.px,
                  height: 50.px,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      '100px x 50px',
                      style: TextStyle(color: Colors.white, fontSize: 12.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 2. 本地存储示例
          _buildSection(
            title: '2. 本地存储 (SharedPreferences)',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('当前计数：$_counter', style: TextStyle(fontSize: 16.sp)),
                SizedBox(height: 8.px),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: _incrementCounter,
                      child: const Text('增加'),
                    ).onTap(_incrementCounter),
                    SizedBox(width: 8.px),
                    ElevatedButton(
                      onPressed: _resetCounter,
                      child: const Text('重置'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 3. 事件总线示例
          _buildSection(
            title: '3. 事件总线',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_eventMessage, style: TextStyle(fontSize: 14.sp)),
                SizedBox(height: 8.px),
                const Text(
                  '点击上方增加按钮可触发事件',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          // 4. 扩展方法示例
          _buildSection(
            title: '4. 扩展方法',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '百分比：${0.1234.toPercentage()}',
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 4.px),
                Text(
                  '小数位：${3.14159.toFixedDouble(2)}',
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 4.px),
                Text(
                  '日期：${DateTime.now().format('YYYY-MM-DD HH:mm:ss')}',
                  style: TextStyle(fontSize: 14.sp),
                ),
                SizedBox(height: 4.px),
                Text(
                  '星期：${TimeUtils.getWeekday(DateTime.now(), languageCode: 'zh')}',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ],
            ),
          ),

          // 5. 渐变背景示例
          _buildSection(
            title: '5. 渐变背景',
            child: GradientLayout(
              width: double.infinity,
              height: 100.px,
              gradientColors: const [Colors.blue, Colors.purple],
              child: Center(
                child: Text(
                  '渐变背景组件',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // 6. 缓存图片示例
          _buildSection(
            title: '6. 网络图片缓存',
            child: Row(
              children: [
                CachedImage(
                  url: "https://picsum.photos/200",
                  width: 100.px,
                  height: 100.px,
                  fit: BoxFit.cover,
                  borderRadiusAll: 8,
                ),
                SizedBox(width: 16.px),
                CachedImage(
                  url: "https://picsum.photos/201",
                  width: 100.px,
                  height: 100.px,
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(50),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.px),
      child: Padding(
        padding: EdgeInsets.all(16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.px),
            child,
          ],
        ),
      ),
    );
  }
}

// 自定义事件类
class CounterEvent {
  final int count;
  CounterEvent(this.count);
}
