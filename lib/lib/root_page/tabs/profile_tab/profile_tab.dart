import 'package:flutter/material.dart';

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
