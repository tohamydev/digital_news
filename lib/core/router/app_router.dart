import 'dart:io';

import 'package:digital_news/core/router/routes.dart';
import 'package:digital_news/features/home_news/presentation/screens/home_news_screen.dart';
import 'package:digital_news/features/home_news/presentation/screens/news_detail_screen.dart';
import 'package:digital_news/features/home_news/domain/entities/article.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:digital_news/features/splash/splash_screen.dart';
import 'package:digital_news/features/login/login_screen.dart';

import '../layout/layout_screen.dart';

class AppRouter {
  static const int fadeDuration = 400;

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return _getFadeTransition(const LayoutScreen());
      case Routes.newsDetail:
        final article = settings.arguments as Article;
        return _getFadeTransition(NewsDetailScreen(article: article));
      case Routes.splash:
        return _getFadeTransition(const SplashScreen());
      case Routes.login:
        return _getFadeTransition(const LoginScreen());
      // case Routes.signUp:
      //   return _getFadeTransition(const RegisterScreen());
      // case Routes.home:
      //   return _getFadeTransition(const ChatHomePage());
      //
      // // Add more routes as needed
      default:
        return _getFadeTransition(
            const HomeNewsScreen()); // or any default screen
    }
  }

  Route _getFadeTransition(Widget child) {
    if (Platform.isIOS) {
      return MaterialPageRoute(
        builder: (_) => child,
      );
    } else {
      return PageTransition(
        child: child,
        type: PageTransitionType.fade,
        duration: const Duration(milliseconds: fadeDuration),
      );
    }
  }
}
