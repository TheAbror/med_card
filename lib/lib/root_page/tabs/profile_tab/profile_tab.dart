import 'package:med_card/core/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // ElevatedButton(
          //   onPressed: () => context.go('/${AppRoutes.coursesPage}'),
          //   child: const Text('Open courses page'),
          // ),
        ],
      ),
    );
  }
}
