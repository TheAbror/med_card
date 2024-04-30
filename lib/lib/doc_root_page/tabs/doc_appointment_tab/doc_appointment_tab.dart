import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';

class DoctorAppointmentTab extends StatelessWidget {
  const DoctorAppointmentTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> listOfPatients = [
      'Abror Shamuradov',
      'Abbosjon Vositov',
      'Aziza Usmanova',
      'Bekzod Mamatov',
      'Dilnoza Rakhimova',
      'Gulnoza Nurmatova',
      'Feruza Tursunova',
      'Nigora Saidova',
      'Mavluda Akhmedova',
      'Madina Ruzmetova',
    ];
    return ListView.builder(
      shrinkWrap: true,
      itemCount: listOfPatients.length,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemBuilder: (context, index) {
        return Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: ExpansionTile(
            shape: Border(),
            maintainState: true,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            expandedAlignment: Alignment.bottomLeft,
            childrenPadding: EdgeInsets.only(bottom: 10.h, left: 12.w),
            title: Text(listOfPatients[index]),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Time :' ' 12:00'),
                      Text('Phone Number: +998914309090'),
                      Text('Parcel number :' '#$index${1423}$index'),
                      Text('Problem topic: Lorem ipsum'),
                      Text('Comment: Lorem ipsum'),
                      // SizedBox(
                      //   width: 300,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.end,
                      //     children: [
                      //       GestureDetector(
                      //         onTap: () {},
                      //         child: Container(
                      //           height: 35.h,
                      //           margin: EdgeInsets.only(right: 12.w),
                      //           width: 60.w,
                      //           decoration: BoxDecoration(
                      //             color: AppColors.primary,
                      //             borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               'View',
                      //               style: TextStyle(
                      //                 letterSpacing: 0.5,
                      //                 fontSize: 15.sp,
                      //                 color: AppColors.float,
                      //                 fontWeight: FontWeight.w600,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       GestureDetector(
                      //         onTap: () {},
                      //         child: Container(
                      //           height: 35.h,
                      //           margin: EdgeInsets.only(right: 12.w),
                      //           width: 60.w,
                      //           decoration: BoxDecoration(
                      //             color: AppColors.primary,
                      //             borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               'View',
                      //               style: TextStyle(
                      //                 letterSpacing: 0.5,
                      //                 fontSize: 15.sp,
                      //                 color: AppColors.float,
                      //                 fontWeight: FontWeight.w600,
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 35.h,
                          width: 60.w,
                          decoration: BoxDecoration(
                              color: AppColors.float,
                              borderRadius: BorderRadius.all(Radius.circular(8.r)),
                              border: Border.all(color: AppColors.primary)),
                          child: Center(
                            child: Text(
                              'Details',
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 15.sp,
                                color: AppColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 35.h,
                          margin: EdgeInsets.only(right: 12.w),
                          width: 60.w,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.all(Radius.circular(8.r)),
                          ),
                          child: Center(
                            child: Text(
                              'Accept',
                              style: TextStyle(
                                letterSpacing: 0.5,
                                fontSize: 15.sp,
                                color: AppColors.float,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
