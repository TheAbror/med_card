// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:med_card/core/bottomsheet/primary_bottom_sheet.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/core/utils/app_strings.dart';
import 'package:med_card/gen/assets.gen.dart';
import 'package:med_card/lib/root_patient_page/pages/appointment_page/appointment_page.dart';
import 'package:med_card/lib/root_patient_page/pages/signin_page/widgets/dialog_success_failure.dart';

class PatientInfoWhenAccept {
  final String id;
  final String name;
  final String topic;
  final String comment;
  final String time;

  PatientInfoWhenAccept({
    required this.id,
    required this.name,
    required this.topic,
    required this.comment,
    required this.time,
  });
}

class AcceptPatientPage extends StatefulWidget {
  final PatientInfoWhenAccept info;

  const AcceptPatientPage({
    super.key,
    required this.info,
  });

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
          'Мобильная заметка',
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
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
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
                      widget.info.name,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Container(
              height: 40.h,
              width: double.infinity,
              padding: EdgeInsets.only(left: 12.w, top: 10.h),
              decoration: BoxDecoration(
                color: AppColors.float,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                'Тема: ${widget.info.topic}',
                style: TextStyle(fontSize: 16.sp),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Assets.icons.homeTabIcons.indicator.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                    fit: BoxFit.fill,
                    height: 10),
                SizedBox(width: 10.w),
                Text('Нажмите, чтобы включить микрофон'),
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
            SizedBox(height: 10.h),
            Text(
              'Рецепт',
              style: TextStyle(fontSize: 16.sp),
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 10.h),
            Expanded(
              flex: 5,
              child: TextFormField(
                maxLines: null,
                expands: true,
                readOnly: false,
                // controller: _controller2,
                textInputAction: TextInputAction.next,
                textAlignVertical: TextAlignVertical.top, // Ensures the hint text starts at the top
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 206, 204, 204),
                      width: 0.5.w,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary, width: 0.5.w),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Комментарии',
                  fillColor: AppColors.float,
                  hintStyle: const TextStyle(color: AppColors.textSecondary),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);

                        showMessage('Сохранено');
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                            child: Text(
                          'Сохранить изменения',
                          style: TextStyle(
                            color: AppColors.float,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);

                        showMessage('Сохранено');
                      },
                      child: Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                            child: Text(
                          'Опубликовать в сети',
                          style: TextStyle(
                            color: AppColors.float,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
