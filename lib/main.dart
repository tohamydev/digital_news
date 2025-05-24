import 'package:digital_news/core/di/dependency_injection.dart';
import 'package:digital_news/core/components/connectivity_wrapper.dart';
import 'package:digital_news/core/router/app_router.dart';
import 'package:digital_news/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  await dotenv.load(fileName: ".env");
  await setGetIt();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ConnectivityWrapper(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Digital News',
            theme: AppTheme.appTheme,
            initialRoute: Routes.splash,
            onGenerateRoute: (settings) {
              return AppRouter().generateRoute(settings);
            },
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
          ),
        );
      },
    );
  }
}
