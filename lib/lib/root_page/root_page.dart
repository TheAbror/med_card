import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'bloc/root_bloc.dart';
import 'tabs/home_tab/home_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tabs/profile_tab/profile_tab.dart';
import '../../core/nav_bar/custom_water_drop_nav_bar.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final Color navigationBarColor = Colors.green;
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  List<Widget> pages = [
    const HomeTab(),
    Container(
      alignment: Alignment.center,
      child: Icon(
        Icons.email,
        size: 56,
        color: Colors.blue[400],
      ),
    ),
    const ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [pages[selectedIndex]],
          ),
          bottomNavigationBar: CustomWaterDropNavBar(
            backgroundColor: AppColors.textMain,
            selectedTextColor: AppColors.primary,
            unSelectedTextColor: AppColors.primary,
            waterDropColor: AppColors.primary,
            inactiveIconColor: AppColors.primary,
            selectedIndex: selectedIndex,
            barItems: <BarItem>[
              BarItem(
                label: 'Главный',
                filledIcon: Icons.home,
                outlinedIcon: Icons.home_outlined,
              ),
              BarItem(
                label: 'Медкарта',
                filledIcon: Icons.email_rounded,
                outlinedIcon: Icons.email_outlined,
              ),
              BarItem(
                label: 'Еще',
                filledIcon: Icons.folder_rounded,
                outlinedIcon: Icons.folder_outlined,
              ),
            ],
            onItemSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
              pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 10),
                curve: Curves.easeOutCubic,
              );
            },
          ),
        );
      },
    );
  }
}
