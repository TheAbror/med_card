import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/core/utils/app_strings.dart';
import 'package:med_card/gen/assets.gen.dart';
import 'package:med_card/lib/root_patient_page/pages/appointment_page/appointment_page.dart';

class AcceptPatientPage extends StatefulWidget {
  const AcceptPatientPage({super.key});

  @override
  State<AcceptPatientPage> createState() => _AcceptPatientPageState();
}

class _AcceptPatientPageState extends State<AcceptPatientPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: AppColors.background,
        title: Text(
          'Notes',
          style: TextStyle(color: AppColors.primary),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
          icon: Assets.icons.figmaIcons.arrowLeft.svg(
            colorFilter: ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
            width: 24.w,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 8.w),
                Expanded(
                  child: Container(
                    height: 40.h,
                    padding: EdgeInsets.only(left: 12.w, top: 9.h),
                    decoration: BoxDecoration(
                      color: AppColors.float,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      'Abror Shamuradov',
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Assets.icons.homeTabIcons.indicator.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.iconSecondary,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.fill,
                    height: 10),
                SizedBox(width: 10.w),
                Text('Tap to start microphone'),
                Spacer(),
                Container(
                  height: 48.w,
                  width: 48.w,
                  decoration: BoxDecoration(
                    color: AppColors.float,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    Icons.mic,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            FromToFields(
              hintText: 'Выберите лекарство',
              suffixIcon: true,
              controller: _controller,
              onTap: () async {
                final result = await PrimaryBottomSheet.show(
                  context,
                  isSearchNeeded: true,
                  heightRatio: 0.9,
                  isConfirmationNeeded: false,
                  title: 'Выберите лекарство',
                  selectedValue: 'Abror Shamuradov',
                  initialList: AppStrings.listOfPills,
                );

                if (result != null) {
                  if (!mounted) return;
                  _controller.text = result;
                  print(result);
                }
              },
            ),
            SizedBox(height: 20.h),
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.float,
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
