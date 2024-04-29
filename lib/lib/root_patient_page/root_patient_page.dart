import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/gen/assets.gen.dart';
import 'bloc/root_bloc.dart';
import 'tabs/home_tab/home_tab.dart';
import 'package:flutter/material.dart';
import 'tabs/more_tab/more_tab.dart';
import '../../core/nav_bar/custom_water_drop_nav_bar.dart';

class RootPatientPage extends StatefulWidget {
  const RootPatientPage({super.key});

  @override
  State<RootPatientPage> createState() => _RootPatientPageState();
}

class _RootPatientPageState extends State<RootPatientPage> {
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
    Container(
      alignment: Alignment.center,
      child: Icon(
        Icons.chat,
        size: 56,
        color: Colors.blue[400],
      ),
    ),
    const MoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        var route = Assets.icons.figmaIcons;

        return Scaffold(
          appBar: selectedIndex == 1 || selectedIndex == 3
              ? AppBar(
                  title: Text(
                    selectedIndex == 1 ? 'Мед Карта' : 'More',
                    style: TextStyle(color: AppColors.primary),
                  ),
                  elevation: 1,
                  backgroundColor: AppColors.background,
                  leading: SizedBox(),
                )
              : PreferredSize(
                  preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
                  child: SizedBox(
                    height: 0,
                  ),
                ),
          backgroundColor: AppColors.background,
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
                outlinedIcon: route.home.path,
                filledIcon: route.homeFilled.path,
              ),
              BarItem(
                label: 'Мед Карта',
                outlinedIcon: route.medcard.path,
                filledIcon: route.medcardFilled.path,
              ),
              BarItem(
                label: 'Dr.AI',
                outlinedIcon: route.chatEmpty.path,
                filledIcon: route.chatFiled.path,
              ),
              BarItem(
                label: 'Еще',
                outlinedIcon: route.more.path,
                filledIcon: route.moreFilled.path,
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
