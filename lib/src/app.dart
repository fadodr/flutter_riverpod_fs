import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testapp/src/config/theme.dart';
import '../src/config/routes/route_generator.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* pass the source color and themeMode to the theme setting,
    then material3 will generate all needed colors based on the source color
    provided*/
    final settings = ValueNotifier(
      ThemeSettings(
        sourceColor: Colors.red,
        themeMode: ThemeMode.light,
      ),
    );

    //notification listener notifies when the theme mode is switch to light or dark 
    //while the builder rebuild the whole material app to adapt to the change in teheme
    return Builder(
      builder: (context) {
        return ThemeProvider(
          settings: settings,
          lightDynamic: null,
          darkDynamic: null,
          child: NotificationListener<ThemeSettingChange>(
            onNotification: (notification) {
              settings.value = notification.settings;
              return true;
            },
            child: ValueListenableBuilder<ThemeSettings>(
              valueListenable: settings,
              builder: (context, value, _) {
                final theme = ThemeProvider.of(context);
                return ScreenUtilInit(
                  designSize: const Size(392.7, 759.3),
                  minTextAdapt: true,
                  useInheritedMediaQuery: true,
                  builder: (context, _) {
                    return MaterialApp(
                      title: 'Test App',
                      useInheritedMediaQuery: true,
                      locale: DevicePreview.locale(context),
                      builder: DevicePreview.appBuilder,
                      navigatorKey: navigatorKey,
                      debugShowCheckedModeBanner: false,
                      themeMode: theme.toThemeMode(),
                      theme: theme.light(settings.value.sourceColor),
                      darkTheme: theme.dark(settings.value.sourceColor),
                      initialRoute: '/',
                      onGenerateRoute: RouteGenerator.generateRoute,
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
