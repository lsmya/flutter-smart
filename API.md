# API 文档

## 工具类 (Utils)

### SpUtils

SharedPreferences 封装工具类，提供便捷的本地存储操作。

#### 初始化

```dart
await SpUtils.init();
```

#### 基本类型存储

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `putString(key, value)` | 存储字符串 | key: String, value: String | Future\<bool\> |
| `getString(key, {defValue})` | 获取字符串 | key: String, defValue: String | String |
| `putInt(key, value)` | 存储整数 | key: String, value: int | Future\<bool\> |
| `getInt(key, {defValue})` | 获取整数 | key: String, defValue: int | int |
| `putBool(key, value)` | 存储布尔值 | key: String, value: bool | Future\<bool\> |
| `getBool(key, {defValue})` | 获取布尔值 | key: String, defValue: bool | bool |
| `putDouble(key, value)` | 存储双精度 | key: String, value: double | Future\<bool\> |
| `getDouble(key, {defValue})` | 获取双精度 | key: String, defValue: double | double |

#### 复杂类型存储

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `putObject(key, value)` | 存储对象 | key: String, value: Object | Future\<bool\> |
| `getObject(key)` | 获取对象 | key: String | Map\<String, dynamic\> |
| `putObjectList(key, list)` | 存储对象列表 | key: String, list: List | Future\<bool\> |
| `getObjectList(key)` | 获取对象列表 | key: String | List\<Map\<String, dynamic\>\> |

#### 工具方法

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `hasKey(key)` | 是否包含key | key: String | bool |
| `getKeys()` | 获取所有key | - | Set\<String\> |
| `remove(key)` | 删除指定key | key: String | Future\<bool\> |
| `clear()` | 清空所有数据 | - | Future\<bool\> |

---

### TimeUtils

时间处理工具类。

#### 常量

| 常量 | 说明 | 值 |
|------|------|-----|
| `oneSecondMillis` | 一秒的毫秒数 | 1000 |
| `oneMinuteMillis` | 一分钟的毫秒数 | 60000 |
| `oneHourMillis` | 一小时的毫秒数 | 3600000 |
| `oneDayMillis` | 一天的毫秒数 | 86400000 |

#### 方法

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `currentTimeMillis()` | 获取当前时间戳（毫秒） | - | int |
| `getWeekday(dateTime, {languageCode, short})` | 获取星期名称 | dateTime: DateTime, languageCode: String ('zh'/'en'), short: bool | String |

---

### ScreenAdapterUtils

屏幕适配工具类，基于 flutter_screenutil 封装。

#### 初始化

```dart
ScreenAdapterUtils.init(
  child: MyApp(),
  designWidth: 375,   // 设计稿宽度，默认 375
  designHeight: 812,  // 设计稿高度，默认 812
)
```

#### 使用适配

```dart
Container(
  width: 100.px,   // 适配宽度
  height: 50.px,   // 适配高度
)

Text(
  'Hello',
  style: TextStyle(fontSize: 16.sp),  // 适配字体
)
```

---

### ScreenUtils

屏幕信息获取工具类。

| 属性 | 说明 | 类型 |
|------|------|------|
| `screenWidth` | 屏幕宽度 | double |
| `screenHeight` | 屏幕高度 | double |
| `statusBarHeight` | 状态栏高度 | double |
| `bottomBarHeight` | 底部安全区高度 | double |

---

### EventBusUtils

事件总线工具类，支持类型安全的事件发送和订阅。

#### 基本用法

```dart
// 1. 定义事件类
class LoginEvent {
  final String username;
  LoginEvent(this.username);
}

// 2. 发送事件
EventBusUtils.sendEvent(LoginEvent('John'));

// 3. 订阅事件
StreamSubscription subscription = EventBusUtils.on<LoginEvent>((event) {
  print('User: ${event.username}');
});

// 4. 取消订阅
subscription.cancel();
```

#### 在 StatefulWidget 中使用

```dart
class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> with EventBusMixin {
  @override
  void initState() {
    super.initState();
    // 自动管理生命周期
    subscribe<LoginEvent>((event) {
      print('User: ${event.username}');
    });
  }
}
```

---

### JsonUtils

JSON 工具类，提供 Map、List、String 之间的转换。

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `mapToString(map)` | Map 转 String | map: Map\<String, dynamic\> | String |
| `stringToMap(str)` | String 转 Map | str: String | Map\<String, dynamic\> |
| `listToString(list)` | List 转 String | list: List\<dynamic\> | String |
| `stringToList(str)` | String 转 List | str: String | List\<dynamic\> |
| `mapToList(map)` | Map 转 List | map: Map\<String, dynamic\> | List\<dynamic\> |

---

## 扩展方法 (Extensions)

### ExtensionString

字符串扩展方法。

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `isNullOrEmpty()` | 判断是否为 null 或空 | - | bool |
| `base64Encode()` | Base64 编码 | - | String? |
| `base64Decode()` | Base64 解码 | - | String? |
| `hideNumber(phoneNo, {start, end, replacement})` | 隐藏敏感数字 | phoneNo: String, start: int, end: int, replacement: String | String |

---

### ExtensionList

列表扩展方法。

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `isNullOrEmpty()` | 判断是否为 null 或空 | - | bool |
| `sum(f)` | 求和 | f: Function | T extends num |

---

### ExtensionMap

Map 扩展方法。

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `isNullOrEmpty()` | 判断是否为 null 或空 | - | bool |
| `merge(other)` | 合并两个 Map | other: Map\<K, V\> | Map\<K, V\> |
| `filter(test)` | 筛选符合条件的键值对 | test: Function | Map\<K, V\> |
| `mapValues(transform)` | 转换 Map 的值 | transform: Function | Map\<K, R\> |

---

### ExtensionDouble

Double 扩展方法。

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `isNull()` | 判断是否为 null | - | bool |
| `toFixedDouble(fractionDigits)` | 保留指定小数位数 | fractionDigits: int | double |
| `toPercentage({fractionDigits})` | 转换为百分比字符串 | fractionDigits: int | String |
| `orDefault([defaultValue])` | 安全获取值 | defaultValue: double | double |

---

### ExtensionWidget

Widget 扩展方法。

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `onTap(onTap)` | 添加点击事件 | onTap: Function | Widget |
| `onLongPress(onLongPress)` | 添加长按事件 | onLongPress: Function | Widget |

---

### DateTimeExtension

DateTime 扩展方法。

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `format(pattern)` | 格式化时间 | pattern: String | String |
| `getThisYear()` | 获取年份 | - | String |
| `getThisMonth()` | 获取月份 | - | String |
| `getThisDay()` | 获取日期 | - | String |

#### 支持的格式化占位符

| 占位符 | 说明 | 示例 |
|--------|------|------|
| `YYYY` | 四位年份 | 2024 |
| `YY` | 两位年份 | 24 |
| `MM` | 两位月份 | 01-12 |
| `M` | 月份 | 1-12 |
| `DD` | 两位日期 | 01-31 |
| `D` | 日期 | 1-31 |
| `HH` | 两位24小时制 | 00-23 |
| `H` | 24小时制 | 0-23 |
| `hh` | 两位12小时制 | 01-12 |
| `h` | 12小时制 | 1-12 |
| `mm` | 两位分钟 | 00-59 |
| `m` | 分钟 | 0-59 |
| `ss` | 两位秒数 | 00-59 |
| `s` | 秒数 | 0-59 |
| `SSS` | 三位毫秒 | 000-999 |

---

### DateStringExtension

String 转 DateTime 扩展。

| 方法 | 说明 | 参数 | 返回值 |
|------|------|------|--------|
| `toDateTime()` | 解析为 DateTime | - | DateTime |

---

## 自定义组件 (Widgets)

### CachedImage

带缓存的网络图片组件。

#### 参数

| 参数 | 类型 | 说明 | 默认值 |
|------|------|------|--------|
| `url` | String | 图片URL | 必填 |
| `width` | double? | 宽度 | null |
| `height` | double? | 高度 | null |
| `fit` | BoxFit? | 填充方式 | null |
| `borderRadius` | BorderRadiusGeometry? | 圆角 | null |
| `borderRadiusAll` | double | 全圆角 | 0 |
| `placeholderAssets` | String? | 占位图 | 默认占位图 |
| `errorAssets` | String? | 错误图 | 默认占位图 |

#### 示例

```dart
CachedImage(
  url: 'https://example.com/image.jpg',
  width: 100,
  height: 100,
  fit: BoxFit.cover,
  borderRadiusAll: 10,
)
```

---

### GradientLayout

渐变背景容器。

#### 参数

| 参数 | 类型 | 说明 | 默认值 |
|------|------|------|--------|
| `child` | Widget? | 子组件 | null |
| `width` | double? | 宽度 | null |
| `height` | double? | 高度 | null |
| `backgroundColor` | Color? | 背景色 | null |
| `gradientColors` | List\<Color\>? | 渐变色列表 | null |

#### 示例

```dart
GradientLayout(
  width: double.infinity,
  height: 200,
  gradientColors: [Colors.blue, Colors.purple],
  child: Center(
    child: Text('Gradient'),
  ),
)
```
