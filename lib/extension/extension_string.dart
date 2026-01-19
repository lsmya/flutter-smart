import 'dart:convert';

/// String 扩展，提供常用字符串操作
extension ExtensionString on String? {
  /// 判断字符串是否为 null 或空字符串
  bool isNullOrEmpty() => this == null || this!.isEmpty;

  /// 对当前字符串进行 Base64 编码
  /// 
  /// 如果字符串为 null 或空，则返回 null
  String? base64Encode() {
    if (isNullOrEmpty()) {
      return null;
    }
    return base64.encode(utf8.encode(this!));
  }

  /// 对当前 Base64 字符串进行解码
  /// 
  /// 如果字符串为 null 或空，或者解码失败，则返回 null
  String? base64Decode() {
    if (isNullOrEmpty()) {
      return null;
    }
    try {
      return utf8.decode(base64.decode(this!));
    } catch (e) {
      // Base64 decoding error
      return null;
    }
  }

  /// 隐藏敏感数字（如手机号）的中间部分
  /// 
  /// [phoneNo] 待处理的数字字符串
  /// [start] 开始隐藏的索引（包含），默认 3
  /// [end] 结束隐藏的索引（不包含），默认 7
  /// [replacement] 替换的字符串，默认 '****'
  String hideNumber(
    String phoneNo, {
    int start = 3,
    int end = 7,
    String replacement = '****',
  }) {
    return phoneNo.replaceRange(start, end, replacement);
  }
}

/// 针对非空 String 的扩展（预留）
extension ExtensionNullString on String {}
