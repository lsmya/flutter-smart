import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 屏幕适配工具类，基于 flutter_screenutil 封装
class ScreenAdapterUtils {
  /// 初始化屏幕适配
  ///
  /// [child] 根组件
  /// [designWidth] 设计稿宽度，默认 375
  /// [designHeight] 设计稿高度，默认 812
  static Widget init({
    required Widget child,
    int designWidth = 375,
    int designHeight = 812,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var maxHeight = constraints.maxHeight;
        return ScreenUtilInit(
          designSize: Size(
            designWidth.toDouble(),
            maxHeight > 0 ? maxHeight : designHeight.toDouble(),
          ),
          child: child,
        );
      },
    );
  }
}

/// double 类型的适配扩展
extension DoubleScreenAdapterExtension on double {
  /// 转换为适配后的宽度像素值 (w)
  double get px => w;

  /// 转换为适配后的字体大小 (sp)
  double get sp => ScreenUtil().setSp(this);
}

/// int 类型的适配扩展
extension IntScreenAdapterExtension on int {
  /// 转换为适配后的宽度像素值 (w)
  double get px => toDouble().px;

  /// 转换为适配后的字体大小 (sp)
  double get sp => toDouble().sp;
}
