import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wireframe_mobile/common/pages/splash_page.dart';
import 'package:wireframe_mobile/home/view/about_page.dart';
import 'package:wireframe_mobile/home/view/book_list_page.dart';
import 'package:wireframe_mobile/home/view/home_page.dart';
import 'package:wireframe_mobile/scanner/view/scanner_page.dart';
import 'package:wireframe_mobile/home/view/info_page.dart';

import '../home/view/about_me_page.dart'; // Import halaman InfoPage

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<AboutRoute>(path: 'about'),
    TypedGoRoute<InfoRoute>(path: 'info'), // Tambahkan rute untuk info_page
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

class AboutRoute extends GoRouteData {
  const AboutRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutPage();
  }
}

class InfoRoute extends GoRouteData {
  // Definisi rute untuk InfoPage
  const InfoRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const InfoPage(); // Pastikan ini merujuk ke InfoPage
  }

  void push(BuildContext context) {}
}

@TypedGoRoute<ScannerRoute>(path: '/scan')
class ScannerRoute extends GoRouteData {
  const ScannerRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ScannerPage();
  }
}

@TypedGoRoute<BookListRoute>(path: '/books')
class BookListRoute extends GoRouteData {
  const BookListRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BookListPage(); // Pastikan BookListPage sudah terdefinisi
  }
}

@TypedGoRoute<AboutMeRoute>(path: '/about-me')
class AboutMeRoute extends GoRouteData {
  const AboutMeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AboutMePage(); // Pastikan ini sesuai dengan nama kelas halaman
  }
}
