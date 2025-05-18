import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNavbar extends StatelessWidget {
  final int currentIndex;

  const CustomNavbar({super.key, required this.currentIndex});

  void _navigateTo(int index) {
    switch (index) {
      case 0:
        if (Get.currentRoute != '/home') Get.offNamed('/home');
        break;
      case 1:
        if (Get.currentRoute != '/materi') Get.offNamed('/materi');
        break;
      case 2:
        if (Get.currentRoute != '/latihan') Get.offNamed('/latihan');
        break;
      case 3:
        if (Get.currentRoute != '/profil') Get.offNamed('/profil');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF387FFF),
      unselectedItemColor: Colors.black45,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: _navigateTo,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Materi'),
        BottomNavigationBarItem(icon: Icon(Icons.flash_on), label: 'Latihan'),
        // BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}
