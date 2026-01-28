# Changelog

All notable changes to this project will be documented in this file.

## [0.0.4] - 2026-01-21

### Added
- 添加 `DateUtils` 日期处理工具类
    - `format()` - 自定义日期格式化
    - `timeAgo()` - 相对时间显示（如"3分钟前"）
- 添加 `extension_int.dart` 整数扩展
    - `toRomanNumerals()` - 转换为罗马数字
    - `isEvenOrOdd()` - 判断奇偶数

### Changed
- 优化 `EventBusUtils` 事件订阅性能
- 改进 `GradientLayout` 组件的渐变渲染效率

### Fixed
- 修复 `JsonUtils.mapToList()` 在空输入时的崩溃问题
- 修复 `extension_widget.dart` 中 `onTap()` 事件穿透问题

## [0.0.3] - 2026-01-20

### Fixed
- 修复部分扩展方法的空安全处理

## [0.0.2] - 2026-01-19

### Added
- 完善项目导出结构，导出所有模块
- 添加 `extension_double.dart` 扩展功能
  - `isNull()` - 判断是否为 null
  - `toFixedDouble()` - 保留指定小数位数
  - `toPercentage()` - 转换为百分比字符串
  - `orDefault()` - 安全获取值
- 添加 `extension_map.dart` 扩展功能
  - `isNullOrEmpty()` - 判断 Map 是否为空
  - `merge()` - 合并两个 Map
  - `filter()` - 筛选符合条件的键值对
  - `mapValues()` - 转换 Map 的值
- 添加 `extension_widget.dart` 扩展功能
  - `onTap()` - 为 Widget 添加点击事件
  - `onLongPress()` - 为 Widget 添加长按事件
- 添加 `JsonUtils` 工具类
  - `mapToString()` - Map 转 String
  - `stringToMap()` - String 转 Map
  - `listToString()` - List 转 String
  - `stringToList()` - String 转 List
  - `mapToList()` - Map 转 List
- 添加 `EventBusUtils` 事件总线工具
  - 支持类型安全的事件发送和订阅
  - 提供 `EventBusMixin` 自动管理订阅生命周期
- 添加 `GradientLayout` 渐变背景组件
- 完善 `CachedImage` 组件，支持占位符和错误图片
- 完善项目文档和示例

### Changed
- 优化导出文件结构
- 改进代码注释和文档

### Fixed
- 修复部分扩展方法的空安全处理

## [0.0.1] - Initial Release

### Added
- 初始版本发布
- `SpUtils` - SharedPreferences 封装工具
- `TimeUtils` - 时间处理工具
- `ScreenAdapterUtils` - 屏幕适配工具
- `ScreenUtils` - 屏幕信息获取工具
- 基础扩展功能
  - `ExtensionString` - 字符串扩展
  - `ExtensionList` - 列表扩展
- `CachedImage` - 网络图片缓存组件
