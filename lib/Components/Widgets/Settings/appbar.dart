import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_analytic/Controllers/auth_controller.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String judul;

  CustomAppBar({Key? key, required this.judul}) : super(key: key); // Remove the const constructor

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>(); // Use Get.find to retrieve the controller

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: preferredSize.height, // Set the preferred size height
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            judul, // The title passed dynamically
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const SizedBox(width: 12),
              PopupMenuButton<int>(
                icon: const Icon(Icons.person_outline, color: Colors.black45),
                onSelected: (value) {
                  if (value == 1) {
                    authController.logout(); // Trigger logout
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(value: 1, child: Text('Logout')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60); // Set the height of the app bar
}
