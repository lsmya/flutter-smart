
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTransitions {
  /// 构建滑动过渡动画
  /// [state] GoRouter 状态
  /// [child] 子 Widget
  static Page<T> buildSlideTransition<T>(GoRouterState state, Widget child) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 150),
      // 设置动画时长
      reverseTransitionDuration: const Duration(milliseconds: 150),
      // 可选：设置返回动画时长
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
    );
  }

  /// 淡入淡出
  static Page<T> buildFadeTransition<T>(GoRouterState state, Widget child) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  /// 缩放效果
  static Page<T> buildScaleTransition<T>(GoRouterState state, Widget child) {
    return CustomTransitionPage<T>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(
          scale: Tween<double>(begin: 0.8, end: 1.0).animate(animation),
          child: child,
        );
      },
    );
  }
}
