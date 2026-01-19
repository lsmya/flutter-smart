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

  /// 获取指定日期的星期名称
  ///
  /// [dateTime] 待查询的日期
  /// [languageCode] 语言代码，支持 'zh' (中文) 和 'en' (英文)，默认 'en'
  /// [short] 是否返回简称（如 '周一' 或 'Mon'），默认 false
  static String getWeekday(
    DateTime? dateTime, {
    String languageCode = 'en',
    bool short = false,
  }) {
    if (dateTime == null) return "";
    String weekday = "";
    switch (dateTime.weekday) {
      case 1:
        weekday = languageCode == 'zh' ? '星期一' : 'Monday';
        break;
      case 2:
        weekday = languageCode == 'zh' ? '星期二' : 'Tuesday';
        break;
      case 3:
        weekday = languageCode == 'zh' ? '星期三' : 'Wednesday';
        break;
      case 4:
        weekday = languageCode == 'zh' ? '星期四' : 'Thursday';
        break;
      case 5:
        weekday = languageCode == 'zh' ? '星期五' : 'Friday';
        break;
      case 6:
        weekday = languageCode == 'zh' ? '星期六' : 'Saturday';
        break;
      case 7:
        weekday = languageCode == 'zh' ? '星期日' : 'Sunday';
        break;
      default:
        break;
    }
    return languageCode == 'zh'
        ? (short ? weekday.replaceAll('星期', '周') : weekday)
        : weekday.substring(0, short ? 3 : weekday.length);
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

  /// 获取当前日期的年份字符串（四位）
  ///
  /// 示例：`DateTime.now().getThisYear()` -> "2024"
  String getThisYear() {
    return year.toString().padLeft(4, '0');
  }

  /// 获取当前日期的月份字符串（两位，01-12）
  ///
  /// 示例：`DateTime.now().getThisMonth()` -> "01"
  String getThisMonth() {
    return month.toString().padLeft(2, '0');
  }

  /// 获取当前日期的日期字符串（两位，01-31）
  ///
  /// 示例：`DateTime.now().getThisDay()` -> "01"
  String getThisDay() {
    return day.toString().padLeft(2, '0');
  }
}
