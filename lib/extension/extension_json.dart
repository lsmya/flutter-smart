import 'dart:convert';

class JsonUtils {
  /// 将 Map 转换为 String
  static String mapToString(Map<String, dynamic> map) {
    return map.toString();
  }

  /// 将 String 转换为 Map
  static Map<String, dynamic> stringToMap(String str) {
    return str.isNotEmpty ? Map<String, dynamic>.from(json.decode(str)) : {};
  }

  /// 将 List 转换为 String
  static String listToString(List<dynamic> list) {
    return list.toString();
  }

  /// 将 String 转换为 List
  static List<dynamic> stringToList(String str) {
    return str.isNotEmpty ? List<dynamic>.from(json.decode(str)) : [];
  }

  /// 将 Map 转换为 List
  static List<dynamic> mapToList(Map<String, dynamic> map) {
    return map.entries.map((entry) => entry.value).toList();
  }
}
