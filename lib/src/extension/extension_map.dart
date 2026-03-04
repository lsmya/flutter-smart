extension ExtensionMap<K, V> on Map<K, V>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;

  /// 合并两个 Map
  Map<K, V> merge(Map<K, V> other) {
    if (isNullOrEmpty()) {
      return other;
    }
    return {...this!, ...other};
  }

  /// 筛选符合条件的键值对
  Map<K, V> filter(bool Function(K key, V value) test) {
    if (isNullOrEmpty()) {
      return {};
    }
    final Map<K, V> result = {};
    this!.forEach((K key, V value) {
      if (test(key, value)) {
        result[key] = value;
      }
    });
    return result;
  }

  /// 将 Map 的值转换为另一种类型
  Map<K, R> mapValues<R>(R Function(V value) transform) {
    if (isNullOrEmpty()) {
      return {};
    }
    final Map<K, R> result = {};
    this!.forEach((K key, V value) {
      result[key] = transform(value);
    });
    return result;
  }
}
