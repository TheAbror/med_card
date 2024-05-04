import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/buttons/action_button.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/core/router/app_routes.dart';
import 'package:med_card/core/utils/app_strings.dart';
import '../../../../core/bottomsheet/primary_bottom_sheet.dart';
import 'bloc/appointment_bloc.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final List<DateTime> days = List.generate(
    7,
    (index) => DateTime.now().add(Duration(days: index)),
  );

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppointmentBloc(),
      child: BlocBuilder<AppointmentBloc, AppointmentState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 7,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0.1,
                title: Text('Недельный Таб-бар'),
                bottom: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.float, width: 3.0),
                    ),
                  ),
                  tabs: days.map(
                    (day) {
                      String dayLabel = '';
                      if (day.day == DateTime.now().day) {
                        dayLabel = 'Сегодня';
                      } else {
                        dayLabel = day.weekday == 1
                            ? 'Пн'
                            : day.weekday == 2
                                ? 'Вт'
                                : day.weekday == 3
                                    ? 'Ср'
                                    : day.weekday == 4
                                        ? 'Чт'
                                        : day.weekday == 5
                                            ? 'Пт'
                                            : day.weekday == 6
                                                ? 'Сб'
                                                : 'Вс';
                      }
                      return Tab(
                        text: '$dayLabel ${day.day}',
                      );
                    },
                  ).toList(),
                ),
              ),
              body: TabBarView(
                children: days.map((day) {
                  return Container(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      children: [
                        FromToFields(
                          hintText: 'Выберите доктора',
                          suffixIcon: true,
                          controller: _controller,
                          onTap: () async {
                            final result = await PrimaryBottomSheet.show(
                              context,
                              isSearchNeeded: true,
                              heightRatio: 0.9,
                              isConfirmationNeeded: false,
                              title: 'Выберите доктора',
                              selectedValue: 'Abror Shamuradov',
                              initialList: AppStrings.patientList,
                            );

                            if (result != null) {
                              if (!mounted) return;
                              _controller.text = result;
                              // context.read<OrdersBloc>().updateData(pickup: result);
                              print(result);
                            }
                          },
                        ),
                        SizedBox(height: 20.h),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 4, // Number of rows
                          itemBuilder: (context, rowIndex) {
                            final startHour = 8 + (rowIndex * 3);
                            return Row(
                              children: List.generate(
                                3,
                                (colIndex) {
                                  final startTime = TimeOfDay(
                                      hour: startHour + (colIndex ~/ 2),
                                      minute: (colIndex % 2) * 30);
                                  final endTime = colIndex % 2 == 0
                                      ? TimeOfDay(hour: startHour + (colIndex ~/ 2), minute: 30)
                                      : TimeOfDay(hour: startHour + (colIndex ~/ 2) + 1, minute: 0);
                                  return Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        // Update selected indices for the tapped item
                                        context
                                            .read<AppointmentBloc>()
                                            .selectedIndex(rowIndex, colIndex);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(12),
                                        margin: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: state.rowIndex == rowIndex &&
                                                  state.colIndex == colIndex
                                              ? AppColors.primary
                                              : AppColors.float,
                                          borderRadius: BorderRadius.circular(40),
                                          border: Border.all(
                                            color: Colors.grey,
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Text(
                                          '${startTime.format(context)} - ${endTime.format(context)}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: state.rowIndex == rowIndex &&
                                                    state.colIndex == colIndex
                                                ? AppColors.float
                                                : AppColors.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        // SizedBox(height: 20.h),
                        SizedBox(
                          height: 130.h,
                          child: TextFormField(
                            expands: true,
                            minLines: null,
                            maxLines: null,
                            textAlignVertical: TextAlignVertical.top,
                            // onChanged: onChanged,
                            // controller: commentsController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                              border: InputBorder.none, // Remove border color
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.primary, width: 0.5.w),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Комментарии',
                              fillColor: Theme.of(context).colorScheme.surfaceTint,
                              hintStyle: const TextStyle(color: AppColors.textSecondary),
                            ),
                          ),
                        ),
                        Spacer(),
                        ActionButton(
                          text: 'Записаться',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.doctorAppointmentPage,
                            );
                          },
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class FromToFields extends StatefulWidget {
  final TextEditingController controller;
  final Function()? onTap;
  final String hintText;
  final bool? suffixIcon;

  const FromToFields({
    super.key,
    required this.controller,
    required this.onTap,
    required this.hintText,
    this.suffixIcon = false,
  });

  @override
  State<FromToFields> createState() => _FromToFieldsState();
}

class _FromToFieldsState extends State<FromToFields> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.h,
      child: TextFormField(
        readOnly: true,
        onTap: widget.onTap,
        controller: widget.controller,
        textInputAction: TextInputAction.next,
        decoration: ToFromDecoration(
          context,
          widget.hintText,
          widget.suffixIcon ?? false,
        ),
      ),
    );
  }
}

InputDecoration ToFromDecoration(
  BuildContext context,
  String hintText,
  bool suffixIcon,
) {
  return InputDecoration(
    filled: true,
    contentPadding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 12.w),
    border: InputBorder.none,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.stroke, width: 0.5.w),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: hintText,
    fillColor: Theme.of(context).colorScheme.surfaceTint,
    hintStyle: const TextStyle(color: AppColors.textSecondary),
    suffixIcon: suffixIcon
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                height: 24.h,
                width: 24.h,
                child: const Icon(Icons.arrow_drop_down_outlined),
              ),
            ],
          )
        : SizedBox(),
  );
}
