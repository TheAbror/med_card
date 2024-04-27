import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:med_card/gen/assets.gen.dart';
import '../../core/nav_bar/custom_water_drop_nav_bar.dart';
import '../root_page/bloc/root_bloc.dart';
import 'tabs/doctor_appointment_tab/timetable_tab/timetable_tab.dart';
import 'tabs/doctor_more_tab/doctor_more_tab.dart';

class RootDoctorPage extends StatefulWidget {
  const RootDoctorPage({super.key});

  @override
  State<RootDoctorPage> createState() => _RootDoctorPageState();
}

class _RootDoctorPageState extends State<RootDoctorPage> {
  final Color navigationBarColor = Colors.green;
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  List<Widget> pages = [
    Container(
      alignment: Alignment.center,
      child: Text('Root Doctor Page'),
    ),
    // DoctorAppointmentTab(),
    TimetableTab(),
    DoctorMoreTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RootBloc, RootState>(
      builder: (context, state) {
        var route = Assets.icons.figmaIcons;

        return Scaffold(
          // appBar: selectedIndex == 1 || selectedIndex == 2
          //     ? AppBar(
          //         title: Text('More'),
          //         elevation: 1,
          //       )
          //     : PreferredSize(
          //         preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
          //         child: SizedBox(
          //           height: 0,
          //         ),
          //       ),
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
                label: 'Пациенты',
                outlinedIcon: route.users2.path,
                filledIcon: route.users2Filled.path,
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
