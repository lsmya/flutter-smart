# Changelog

All notable changes to this project will be documented in this file.
## [0.0.5] - 2026-02-24

### Added
- 添加 `AppRouter` 路由工具类
  - 基于 go_router 封装的路由管理工具
  - 支持页面跳转、替换和返回操作
  - 提供路由创建的快捷方法
  - 支持自定义页面转场动画
- 添加 `MediaPicker` 媒体选择工具类
  - `takeImage()` - 拍摄照片
  - `takeVideo()` - 拍摄视频
  - `chooseImage()` - 选择照片
  - `chooseVideo()` - 选择视频
  - `chooseMultiImage()` - 多选照片
  - `chooseMultiVideo()` - 多选视频
- 添加 `Button` 通用按钮组件
  - 支持自定义样式、边框和圆角
  - 支持点击、长按和双击事件
  - 灵活的尺寸和间距配置
- 添加 `EditText` 输入框组件
  - 支持自定义文本样式和提示文本
  - 支持多种键盘类型和输入限制
  - 支持自定义边框和光标样式
- 添加 `VerificationBox` 验证码输入框组件
  - 支持 4 位或 6 位验证码输入
  - 支持自定义框样式和焦点样式
  - 支持显示光标和自动聚焦
  - 输入完成自动回调
- 添加 `ExtendedWrap` 扩展流式布局组件
  - 支持最大行数和最小行数限制
  - 支持溢出显示自定义组件
  - 提供灵活的对齐和间距配置
- 添加 `JsonUtils` JSON 处理工具类
  - `mapToString()` - Map 转 String
  - `stringToMap()` - String 转 Map
  - `listToString()` - List 转 String
  - `stringToList()` - String 转 List
  - `mapToList()` - Map 转 List
- 添加 `AppTransitions` 页面转场动画工具
  - 提供多种预设的页面转场效果
  - 支持自定义转场动画

### Changed
- 优化项目导出结构，统一管理所有模块
- 改进代码文档和注释
- 更新依赖版本，提升兼容性

### Fixed
- 修复部分组件的空安全处理问题
- 修复扩展方法的类型推断问题

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