# flutter_smart

一个功能丰富的 Flutter 工具库，提供常用的工具类、扩展方法和自定义组件，帮助你更高效地开发 Flutter 应用。

[![pub package](https://img.shields.io/pub/v/flutter_smart.svg)](https://pub.dev/packages/flutter_smart)
[![license](https://img.shields.io/github/license/lsmya/flutter_smart)](https://github.com/lsmya/flutter_smart/blob/main/LICENSE)

## 功能特性

### 📦 工具类 (Utils)

- **SpUtils** - SharedPreferences 封装，提供便捷的本地存储操作
- **TimeUtils** - 时间处理工具，支持时间格式化和日期计算
- **ScreenAdapterUtils** - 屏幕适配工具，基于 flutter_screenutil 封装
- **ScreenUtils** - 屏幕信息获取（宽度、高度、状态栏高度等）
- **EventBusUtils** - 事件总线，支持类型安全的事件发送和订阅
- **JsonUtils** - JSON 工具类，提供 Map、List、String 之间的转换

### 🔧 扩展方法 (Extensions)

- **ExtensionString** - 字符串扩展（Base64 编码/解码、隐藏敏感信息等）
- **ExtensionList** - 列表扩展（判空、求和等）
- **ExtensionMap** - Map 扩展（合并、筛选、值转换等）
- **ExtensionDouble** - Double 扩展（百分比转换、保留小数位等）
- **ExtensionWidget** - Widget 扩展（快速添加点击事件等）
- **DateTimeExtension** - DateTime 扩展（时间格式化等）

### 🎨 自定义组件 (Widgets)

- **CachedImage** - 带缓存的网络图片组件，支持占位符和错误处理
- **GradientLayout** - 渐变背景容器

## 安装

在 `pubspec.yaml` 中添加依赖：

```yaml
dependencies:
  flutter_smart: ^0.0.2
```

然后运行：

```bash
flutter pub get
```

## 使用示例

### 1. SpUtils - 本地存储

```dart
import 'package:flutter_smart/flutter_smart.dart';

// 初始化（在 main 函数中）
await SpUtils.init();

// 存储数据
await SpUtils.putString('username', 'John');
await SpUtils.putInt('age', 25);
await SpUtils.putBool('isLogin', true);

// 读取数据
String username = SpUtils.getString('username', defValue: '');
int age = SpUtils.getInt('age', defValue: 0);
bool isLogin = SpUtils.getBool('isLogin', defValue: false);

// 存储对象
Map<String, dynamic> user = {'name': 'John', 'age': 25};
await SpUtils.putObject('user', user);

// 读取对象
Map<String, dynamic> savedUser = SpUtils.getObject('user');
```

### 2. 屏幕适配

```dart
import 'package:flutter_smart/flutter_smart.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtils.init();
  
  runApp(
    ScreenAdapterUtils.init(
      designWidth: 375,  // 设计稿宽度
      designHeight: 812, // 设计稿高度
      child: MyApp(),
    ),
  );
}

// 使用适配
Container(
  width: 100.px,     // 适配宽度
  height: 50.px,     // 适配高度
  child: Text(
    'Hello',
    style: TextStyle(fontSize: 16.sp), // 适配字体大小
  ),
)
```

### 3. 时间处理

```dart
import 'package:flutter_smart/flutter_smart.dart';

// 获取当前时间戳
int timestamp = TimeUtils.currentTimeMillis();

// 格式化时间
DateTime now = DateTime.now();
String formatted = now.format('YYYY-MM-DD HH:mm:ss'); // 2024-01-17 14:30:25
String dateOnly = now.format('YYYY年MM月DD日'); // 2024年01月17日

// 获取星期
String weekday = TimeUtils.getWeekday(now, languageCode: 'zh'); // 星期三
String shortWeekday = TimeUtils.getWeekday(now, languageCode: 'zh', short: true); // 周三

// 字符串转 DateTime
DateTime date = '2024-01-17'.toDateTime();
```

### 4. 扩展方法

```dart
import 'package:flutter_smart/flutter_smart.dart';

// String 扩展
String? text = 'Hello World';
if (!text.isNullOrEmpty()) {
  print(text);
}

String encoded = text.base64Encode(); // Base64 编码
String decoded = encoded.base64Decode(); // Base64 解码

String phone = '13800138000';
String hidden = text.hideNumber(phone); // 138****8000

// List 扩展
List<int>? numbers = [1, 2, 3, 4, 5];
if (!numbers.isNullOrEmpty()) {
  int total = numbers.sum((e) => e); // 求和：15
}

// Map 扩展
Map<String, int>? map1 = {'a': 1, 'b': 2};
Map<String, int> map2 = {'c': 3};
Map<String, int> merged = map1.merge(map2); // {'a': 1, 'b': 2, 'c': 3}

Map<String, int> filtered = map1.filter((key, value) => value > 1); // {'b': 2}

// Double 扩展
double? price = 99.999;
double fixed = price.toFixedDouble(2); // 100.00
String percent = 0.1234.toPercentage(); // 12.34%

// Widget 扩展
Text('Click me').onTap(() {
  print('Tapped!');
});
```

### 5. 事件总线

```dart
import 'package:flutter_smart/flutter_smart.dart';

// 定义事件类
class LoginEvent {
  final String username;
  LoginEvent(this.username);
}

// 发送事件
EventBusUtils.sendEvent(LoginEvent('John'));

// 订阅事件
StreamSubscription subscription = EventBusUtils.on<LoginEvent>((event) {
  print('User logged in: ${event.username}');
});

// 取消订阅
subscription.cancel();

// 在 StatefulWidget 中使用 Mixin 自动管理生命周期
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with EventBusMixin {
  @override
  void initState() {
    super.initState();
    // 自动管理订阅，dispose 时会自动取消
    subscribe<LoginEvent>((event) {
      print('User: ${event.username}');
    });
  }
}
```

### 6. 自定义组件

```dart
import 'package:flutter_smart/flutter_smart.dart';

// CachedImage - 网络图片缓存
CachedImage(
  url: 'https://example.com/image.jpg',
  width: 100,
  height: 100,
  fit: BoxFit.cover,
  borderRadiusAll: 10,
  placeholderAssets: 'assets/placeholder.png',
  errorAssets: 'assets/error.png',
)

// GradientLayout - 渐变背景
GradientLayout(
  width: double.infinity,
  height: 200,
  gradientColors: [
    Colors.blue,
    Colors.purple,
  ],
  child: Center(
    child: Text('Gradient Background'),
  ),
)
```

## 完整示例

查看 [example](example/) 目录获取完整的示例应用。

```bash
cd example
flutter run
```

## 主要依赖

- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) - 屏幕适配
- [shared_preferences](https://pub.dev/packages/shared_preferences) - 本地存储
- [cached_network_image](https://pub.dev/packages/cached_network_image) - 图片缓存
- [event_bus](https://pub.dev/packages/event_bus) - 事件总线

## 贡献

欢迎提交 Issue 和 Pull Request！

## 许可证

本项目采用 [MIT License](LICENSE) 开源协议。

## 更新日志

查看 [CHANGELOG.md](CHANGELOG.md) 了解版本更新历史。

