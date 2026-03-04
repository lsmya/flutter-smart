import 'package:flutter/material.dart';

extension ExtensionWidget on Widget {
  /// 点击事件
  Widget onTap(void Function()? onTap) {
    return GestureDetector(onTap: onTap, child: this);
  }

  /// 长按事件
  Widget onLongPress(void Function()? onLongPress) {
    return GestureDetector(onLongPress: onLongPress, child: this);
  }
}
