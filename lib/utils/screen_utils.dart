import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtils {
  // 获取屏幕宽度
  static double get screenWidth => ScreenUtil().screenWidth;

  // 获取屏幕高度
  static double get screenHeight => ScreenUtil().screenHeight;

  // 获取状态栏高度
  static double get statusBarHeight => ScreenUtil().statusBarHeight;

  // 获取底部安全区高度
  static double get bottomBarHeight => ScreenUtil().bottomBarHeight;
}
