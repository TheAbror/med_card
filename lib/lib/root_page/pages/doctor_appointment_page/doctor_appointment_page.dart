import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';

class DoctorAppointmentPage extends StatelessWidget {
  const DoctorAppointmentPage({super.key});

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        title: Text('Прием пациентов'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                itemCount: listOfPatients.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    child: ExpansionTile(
                      maintainState: true,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      title: Text(listOfPatients[index]),
                      children: [
                        Text('12:00'),
                        Text("Phone Number: +998914309090"),
                        Text('#$index${1423}$index'),
                        const Text("isAdmin: No")
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
