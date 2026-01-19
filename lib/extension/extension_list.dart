extension ExtensionList<E> on List<E>? {
  /// 是否为空或长度为0
  bool isNullOrEmpty() => this == null || this!.isEmpty;

  /// 求和
  T sum<T extends num>(T Function(E element) f) {
    if (isNullOrEmpty()) {
      return 0 as T;
    }
    T total = (T == int ? 0 : 0.0) as T;
    for (var i = 0; i < this!.length; i++) {
      total = (total + f(this![i])) as T;
    }
    return total;
  }
}
