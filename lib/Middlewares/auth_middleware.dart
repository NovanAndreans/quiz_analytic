import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleware extends GetMiddleware {
  final box = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    final isLoggedIn = box.hasData('token');

    if (!isLoggedIn && route != '/login' && route != '/register') {
      // Belum login, arahkan ke halaman login
      return const RouteSettings(name: '/login');
    }

    if (isLoggedIn && (route == '/login' || route == '/register')) {
      // Sudah login, arahkan ke home
      return const RouteSettings(name: '/home');
    }

    // Jika tidak ada masalah, lanjut ke halaman tujuan
    return null;
  }
}
