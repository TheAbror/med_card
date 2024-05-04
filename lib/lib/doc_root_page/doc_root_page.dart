import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:med_card/gen/assets.gen.dart';
import '../../core/nav_bar/custom_water_drop_nav_bar.dart';
import '../root_patient_page/bloc/root_bloc.dart';
import 'charts/weekly_chart.dart';
import 'tabs/doc_appointment_tab/timetable_tab/timetable_tab.dart';
import 'tabs/doc_more_tab/doc_more_tab.dart';
import 'widgets/doctor_home_appbar.dart';

class DocRootPage extends StatefulWidget {
  const DocRootPage({super.key});

  @override
  State<DocRootPage> createState() => _DocRootPageState();
}

class _DocRootPageState extends State<DocRootPage> {
  final Color navigationBarColor = Colors.green;
  int selectedIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  List<Widget> pages = [
    SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            WeeklyChart(),
            Text(
              'data',
              style: TextStyle(fontSize: 0.sp),
            )
          ],
        ),
      ),
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
          appBar: selectedIndex == 0
              ? home_app_bar(context, () {})
              : PreferredSize(
                  preferredSize: Size.fromHeight(MediaQuery.of(context).padding.top),
                  child: SizedBox(height: 0),
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
