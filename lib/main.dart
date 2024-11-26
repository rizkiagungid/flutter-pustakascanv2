import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wireframe_mobile/common/utils/app_theme.dart';
import 'package:wireframe_mobile/common/utils/state_logger.dart';
import 'package:wireframe_mobile/router/router.dart';

void main() async {
  runApp(
    const ProviderScope(
      observers: [StateLogger()],
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: (ctx, _) => MaterialApp.router(
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightThemeData,
            home: child,
            navigatorObservers: [
              FlutterSmartDialog.observer,
            ],
            builder: FlutterSmartDialog.init(),
          );
        },
        restorationScopeId: 'app',
        theme: AppThemes.lightThemeData,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
