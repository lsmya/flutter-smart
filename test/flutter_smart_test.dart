import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_smart/flutter_smart.dart';

void main() {
  group('ExtensionString Tests', () {
    test('isNullOrEmpty should return true for null', () {
      String? text;
      expect(text.isNullOrEmpty(), true);
    });

    test('isNullOrEmpty should return true for empty string', () {
      String? text = '';
      expect(text.isNullOrEmpty(), true);
    });

    test('isNullOrEmpty should return false for non-empty string', () {
      String? text = 'hello';
      expect(text.isNullOrEmpty(), false);
    });

    test('base64Encode should encode string correctly', () {
      String text = 'Hello World';
      String? encoded = text.base64Encode();
      expect(encoded, isNotNull);
      expect(encoded!.length, greaterThan(0));
    });

    test('base64Decode should decode string correctly', () {
      String text = 'Hello World';
      String? encoded = text.base64Encode();
      String? decoded = encoded?.base64Decode();
      expect(decoded, text);
    });

    test('hideNumber should hide middle digits', () {
      String phone = '13800138000';
      String hidden = phone.hideNumber(phone);
      expect(hidden, '138****8000');
    });
  });

  group('ExtensionList Tests', () {
    test('isNullOrEmpty should return true for null', () {
      List<int>? list;
      expect(list.isNullOrEmpty(), true);
    });

    test('isNullOrEmpty should return true for empty list', () {
      List<int>? list = [];
      expect(list.isNullOrEmpty(), true);
    });

    test('isNullOrEmpty should return false for non-empty list', () {
      List<int>? list = [1, 2, 3];
      expect(list.isNullOrEmpty(), false);
    });

    test('sum should calculate total correctly', () {
      List<int> numbers = [1, 2, 3, 4, 5];
      int total = numbers.sum((e) => e);
      expect(total, 15);
    });

    test('sum should return 0 for null list', () {
      List<int>? numbers;
      int total = numbers.sum((e) => e);
      expect(total, 0);
    });
  });

  group('ExtensionMap Tests', () {
    test('isNullOrEmpty should return true for null', () {
      Map<String, int>? map;
      expect(map.isNullOrEmpty(), true);
    });

    test('isNullOrEmpty should return true for empty map', () {
      Map<String, int>? map = {};
      expect(map.isNullOrEmpty(), true);
    });

    test('merge should combine two maps', () {
      Map<String, int> map1 = {'a': 1, 'b': 2};
      Map<String, int> map2 = {'c': 3, 'd': 4};
      Map<String, int> merged = map1.merge(map2);
      expect(merged.length, 4);
      expect(merged['a'], 1);
      expect(merged['c'], 3);
    });

    test('filter should return filtered map', () {
      Map<String, int> map = {'a': 1, 'b': 2, 'c': 3};
      Map<String, int> filtered = map.filter((key, value) => value > 1);
      expect(filtered.length, 2);
      expect(filtered.containsKey('a'), false);
      expect(filtered.containsKey('b'), true);
    });

    test('mapValues should transform values', () {
      Map<String, int> map = {'a': 1, 'b': 2};
      Map<String, String> transformed = map.mapValues((value) => value.toString());
      expect(transformed['a'], '1');
      expect(transformed['b'], '2');
    });
  });

  group('ExtensionDouble Tests', () {
    test('isNull should return true for null', () {
      double? value;
      expect(value.isNull(), true);
    });

    test('isNull should return false for non-null', () {
      double? value = 1.23;
      expect(value.isNull(), false);
    });

    test('toFixedDouble should round to specified decimal places', () {
      double value = 3.14159;
      expect(value.toFixedDouble(2), 3.14);
      expect(value.toFixedDouble(3), 3.142);
    });

    test('toPercentage should format as percentage', () {
      double value = 0.1234;
      expect(value.toPercentage(), '12.34%');
      expect(value.toPercentage(fractionDigits: 1), '12.3%');
    });

    test('orDefault should return value if not null', () {
      double? value = 1.23;
      expect(value.orDefault(), 1.23);
    });

    test('orDefault should return default if null', () {
      double? value;
      expect(value.orDefault(), 0.0);
      expect(value.orDefault(5.0), 5.0);
    });
  });

  group('TimeUtils Tests', () {
    test('currentTimeMillis should return valid timestamp', () {
      int timestamp = TimeUtils.currentTimeMillis();
      expect(timestamp, greaterThan(0));
    });

    test('getWeekday should return correct weekday in Chinese', () {
      DateTime monday = DateTime(2024, 1, 15); // 2024-01-15 is Monday
      String weekday = TimeUtils.getWeekday(monday, languageCode: 'zh');
      expect(weekday, '星期一');
    });

    test('getWeekday should return short weekday in Chinese', () {
      DateTime monday = DateTime(2024, 1, 15);
      String weekday = TimeUtils.getWeekday(monday, languageCode: 'zh', short: true);
      expect(weekday, '周一');
    });

    test('getWeekday should return correct weekday in English', () {
      DateTime monday = DateTime(2024, 1, 15);
      String weekday = TimeUtils.getWeekday(monday, languageCode: 'en');
      expect(weekday, 'Monday');
    });
  });

  group('DateTimeExtension Tests', () {
    test('format should format date correctly', () {
      DateTime date = DateTime(2024, 1, 17, 14, 30, 25);
      expect(date.format('YYYY-MM-DD'), '2024-01-17');
      expect(date.format('HH:mm:ss'), '14:30:25');
      expect(date.format('YYYY-MM-DD HH:mm:ss'), '2024-01-17 14:30:25');
    });

    test('getThisYear should return year string', () {
      DateTime date = DateTime(2024, 1, 17);
      expect(date.getThisYear(), '2024');
    });

    test('getThisMonth should return month string', () {
      DateTime date = DateTime(2024, 1, 17);
      expect(date.getThisMonth(), '01');
    });

    test('getThisDay should return day string', () {
      DateTime date = DateTime(2024, 1, 17);
      expect(date.getThisDay(), '17');
    });
  });

  group('JsonUtils Tests', () {
    test('mapToString should convert map to string', () {
      Map<String, dynamic> map = {'name': 'John', 'age': 25};
      String str = JsonUtils.mapToString(map);
      expect(str, isNotEmpty);
    });

    test('stringToMap should parse JSON string to map', () {
      String jsonStr = '{"name":"John","age":25}';
      Map<String, dynamic> map = JsonUtils.stringToMap(jsonStr);
      expect(map['name'], 'John');
      expect(map['age'], 25);
    });

    test('stringToList should parse JSON array to list', () {
      String jsonStr = '[1,2,3]';
      List<dynamic> list = JsonUtils.stringToList(jsonStr);
      expect(list.length, 3);
      expect(list[0], 1);
    });

    test('mapToList should convert map values to list', () {
      Map<String, dynamic> map = {'a': 1, 'b': 2, 'c': 3};
      List<dynamic> list = JsonUtils.mapToList(map);
      expect(list.length, 3);
    });
  });
}