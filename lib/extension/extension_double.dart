/// Double 类型的常用扩展
extension ExtensionDouble on double? {
  /// 判断是否为 null
  bool isNull() => this == null;

  /// 保留指定小数位数
  /// 
  /// [fractionDigits] 小数位数
  double toFixedDouble(int fractionDigits) {
    if (isNull()) return 0.0;
    return double.parse(this!.toStringAsFixed(fractionDigits));
  }

  /// 转换为百分比字符串
  /// 
  /// [fractionDigits] 小数位数，默认 2
  /// 示例：0.1234.toPercentage() -> "12.34%"
  String toPercentage({int fractionDigits = 2}) {
    if (isNull()) return "0%";
    return "${(this! * 100).toStringAsFixed(fractionDigits)}%";
  }

  /// 安全获取值，如果为 null 则返回默认值
  double orDefault([double defaultValue = 0.0]) {
    return this ?? defaultValue;
  }
}
