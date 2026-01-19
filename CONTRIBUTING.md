# 贡献指南

感谢您考虑为 flutter_smart 贡献代码！

## 如何贡献

### 报告问题

如果您发现了 bug 或有功能建议，请：

1. 检查 [Issues](https://github.com/lsmya/flutter_smart/issues) 中是否已存在相关问题
2. 如果没有，创建一个新的 Issue，并提供以下信息：
   - 问题描述
   - 复现步骤
   - 期望行为
   - 实际行为
   - 环境信息（Flutter 版本、设备等）

### 提交代码

1. Fork 本仓库
2. 创建您的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

### 代码规范

#### 命名规范

- 文件名使用 `lower_case_with_underscores`
- 类名使用 `PascalCase`
- 变量名和方法名使用 `camelCase`
- 常量使用 `lowerCamelCase`

#### 代码风格

- 使用 2 个空格缩进
- 每行代码不超过 120 个字符
- 添加适当的注释，特别是公共 API
- 使用有意义的变量名和方法名

#### 注释规范

```dart
/// 简短的一句话描述
/// 
/// 详细的描述（如果需要）
/// 
/// [参数名] 参数说明
/// 
/// 示例：
/// ```dart
/// var result = method(param);
/// ```
String method(String param) {
  // 实现
}
```

### 测试

- 为新功能添加单元测试
- 确保所有测试通过：`flutter test`
- 确保代码分析无问题：`flutter analyze`

### 提交信息

提交信息应该清晰明了，遵循以下格式：

```
<类型>: <简短描述>

<详细描述（可选）>
```

类型包括：
- `feat`: 新功能
- `fix`: 修复 bug
- `docs`: 文档更新
- `style`: 代码格式调整（不影响功能）
- `refactor`: 重构
- `test`: 测试相关
- `chore`: 构建过程或辅助工具的变动

示例：
```
feat: 添加日期格式化扩展方法

为 DateTime 类添加了 format 方法，支持自定义格式化模板
```

### Pull Request 检查清单

在提交 PR 之前，请确保：

- [ ] 代码遵循项目的代码规范
- [ ] 添加了必要的测试
- [ ] 所有测试都通过
- [ ] 更新了相关文档
- [ ] 更新了 CHANGELOG.md
- [ ] commit 信息清晰明了

## 开发流程

### 设置开发环境

```bash
# 克隆仓库
git clone https://github.com/lsmya/flutter_smart.git
cd flutter_smart

# 获取依赖
flutter pub get

# 运行测试
flutter test

# 运行示例
cd example
flutter run
```

### 项目结构

```
flutter_smart/
├── lib/
│   ├── extension/      # 扩展方法
│   ├── utils/          # 工具类
│   ├── widget/         # 自定义组件
│   └── flutter_smart.dart  # 主入口
├── test/               # 测试文件
├── example/            # 示例应用
├── assets/             # 资源文件
└── README.md           # 项目说明
```

### 添加新功能

1. 在对应目录下创建新文件
2. 在对应的导出文件中添加 export 语句
3. 添加完整的文档注释
4. 编写单元测试
5. 在 example 中添加使用示例
6. 更新 README.md 和 API.md

## 发布流程

仅维护者可以发布新版本：

1. 更新 `pubspec.yaml` 中的版本号
2. 更新 `CHANGELOG.md`
3. 提交更改：`git commit -am "chore: release v0.0.x"`
4. 创建标签：`git tag v0.0.x`
5. 推送标签：`git push --tags`

## 行为准则

- 尊重所有贡献者
- 接受建设性的批评
- 关注对社区最有利的事情
- 对其他社区成员表示同理心

## 许可证

通过贡献代码，您同意您的贡献将在 [MIT License](LICENSE) 下授权。

## 问题？

如有任何问题，请随时开启一个 Issue 或通过 [GitHub Discussions](https://github.com/lsmya/flutter_smart/discussions) 与我们联系。

感谢您的贡献！🎉
