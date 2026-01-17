class TimeUtils {
  TimeUtils._();

  /// 一秒的毫秒数：1000毫秒
  static int oneSecondMillis = 1000;

  /// 一分钟的毫秒数：60秒 = 60000毫秒
  static int oneMinuteMillis = 60 * oneSecondMillis;

  /// 一小时的毫秒数：60分钟 = 3600000毫秒
  static int oneHourMillis = 60 * oneMinuteMillis;

  /// 一天的毫秒数：24小时 = 86400000毫秒
  static int oneDayMillis = 24 * oneHourMillis;

  /// 获取当前时间的毫秒时间戳
  /// 
  /// 返回从 1970-01-01 00:00:00 UTC 到当前时间的毫秒数
  static int currentTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}

extension DateStringExtension on String {
  /// 将字符串解析为 DateTime 对象
  /// 
  /// 支持 ISO 8601 格式的日期时间字符串
  /// 例如：'2024-01-17'、'2024-01-17 14:30:25'、'2024-01-17T14:30:25.000Z'
  /// 
  /// 如果字符串格式不正确，将抛出 FormatException 异常
  DateTime toDateTime() {
    return DateTime.parse(this);
  }
}

extension DateTimeExtension on DateTime {
  /// 格式化时间为指定格式的字符串
  /// 
  /// 支持的格式占位符：
  /// - YYYY: 四位年份
  /// - YY: 两位年份
  /// - MM: 两位月份（01-12）
  /// - M: 月份（1-12）
  /// - DD: 两位日期（01-31）
  /// - D: 日期（1-31）
  /// - HH: 两位24小时制小时（00-23）
  /// - H: 24小时制小时（0-23）
  /// - hh: 两位12小时制小时（01-12）
  /// - h: 12小时制小时（1-12）
  /// - mm: 两位分钟（00-59）
  /// - m: 分钟（0-59）
  /// - ss: 两位秒数（00-59）
  /// - s: 秒数（0-59）
  /// - SSS: 三位毫秒数（000-999）
  /// 
  /// 示例：
  /// ```dart
  /// DateTime now = DateTime.now();
  /// now.format('YYYY-MM-DD'); // 2024-01-17
  /// now.format('YYYY年MM月DD日'); // 2024年01月17日
  /// now.format('HH:mm:ss'); // 14:30:25
  /// now.format('YYYY-MM-DD HH:mm:ss'); // 2024-01-17 14:30:25
  /// ```
  String format(String pattern) {
    String result = pattern;
    
    // 年份
    result = result.replaceAll('YYYY', year.toString().padLeft(4, '0'));
    result = result.replaceAll('YY', (year % 100).toString().padLeft(2, '0'));
    
    // 月份
    result = result.replaceAll('MM', month.toString().padLeft(2, '0'));
    result = result.replaceAll('M', month.toString());
    
    // 日期
    result = result.replaceAll('DD', day.toString().padLeft(2, '0'));
    result = result.replaceAll('D', day.toString());
    
    // 24小时制小时
    result = result.replaceAll('HH', hour.toString().padLeft(2, '0'));
    result = result.replaceAll('H', hour.toString());
    
    // 12小时制小时
    int hour12 = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    result = result.replaceAll('hh', hour12.toString().padLeft(2, '0'));
    result = result.replaceAll('h', hour12.toString());
    
    // 分钟
    result = result.replaceAll('mm', minute.toString().padLeft(2, '0'));
    result = result.replaceAll('m', minute.toString());
    
    // 秒数
    result = result.replaceAll('ss', second.toString().padLeft(2, '0'));
    result = result.replaceAll('s', second.toString());
    
    // 毫秒
    result = result.replaceAll('SSS', millisecond.toString().padLeft(3, '0'));
    
    return result;
  }
}
