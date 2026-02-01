import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 基于 go_router 的路由工具类
class RouterUtils {
  RouterUtils._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  /// 获取当前的 BuildContext
  static BuildContext? get context => navigatorKey.currentState?.context;

  /// GoRouter 实例，需要在 App 初始化时通过 [init] 方法进行设置
  static late GoRouter _goRouter;

  static GoRouter get goRouter => _goRouter;

  /// 初始化 Router
  /// [routes] 路由列表
  /// [initialLocation] 初始路由地址
  static void init({
    required List<RouteBase> routes,
    String initialLocation = '/',
    GoRouterRedirect? redirect,
    Object? initialExtra,
    List<NavigatorObserver>? observers,
    bool debugLogDiagnostics = false,
  }) {
    _goRouter = GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: initialLocation,
      initialExtra: initialExtra,
      routes: routes,
      redirect: redirect,
      observers: observers,
      debugLogDiagnostics: debugLogDiagnostics,
    );
  }

  /// 跳转页面 (使用 pushNamed，符合参考实现)
  static void openPage(String routeName, {Object? extra}) {
    if (context != null) {
      context!.pushNamed(routeName, extra: extra);
    }
  }

  /// 跳转页面并替换当前页面 (使用 replaceNamed，符合参考实现)
  static void openPageAndReplace(String routeName, {Object? extra}) {
    if (context != null) {
      context!.replaceNamed(routeName, extra: extra);
    }
  }

  /// 跳转页面 (使用 Name)
  static void pushNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
  }) {
    if (context != null) {
      context!.pushNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    }
  }

  /// 替换当前页面 (使用 Name)
  static void replaceNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
  }) {
    if (context != null) {
      context!.replaceNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    }
  }

  /// 返回上一页
  static void pop<T extends Object?>([T? result]) {
    if (context != null && context!.canPop()) {
      context!.pop(result);
    }
  }

  /// 直接跳转 (清除之前的路由栈)
  static void go(String routeName, {Object? extra}) {
    if (context != null) {
      context!.go(routeName, extra: extra);
    }
  }

  /// 直接跳转 (使用 Name, 清除之前的路由栈)
  static void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
  }) {
    if (context != null) {
      context!.goNamed(
        name,
        pathParameters: pathParameters,
        queryParameters: queryParameters,
        extra: extra,
      );
    }
  }

  /// 创建路由的快捷方法
  static GoRoute createRoute(String path, {required Widget child}) {
    return createRouteByParam(path, builder: (context, state, _, _) => child);
  }

  /// 创建路由的快捷方法
  static GoRoute createRouteByParam(
    String path, {
    required Function(
      BuildContext context,
      GoRouterState state,
      Map<String, String> pathParameters,
      Object? extra,
    )?
    builder,
    String? name,
    List<RouteBase> routes = const <RouteBase>[],
  }) {
    return GoRoute(
      path: path,
      name: name ?? path,
      builder: (context, state) {
        return builder!(context, state, state.pathParameters, state.extra);
      },
    );
  }
}
