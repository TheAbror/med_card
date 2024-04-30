import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/gen/assets.gen.dart';

class PatientDetailsPage extends StatefulWidget {
  const PatientDetailsPage({super.key});

  @override
  State<PatientDetailsPage> createState() => _PatientDetailsPageState();
}

class _PatientDetailsPageState extends State<PatientDetailsPage> {
  // Sample patient data fetched from backend
  Map<String, dynamic> patientDetails = {
    'name': 'John Doe',
    'age': 30,
    'bloodType': 'AB+',
    'allergies': 'Pollen, Peanuts',
    'illnessHistory': 'None',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        title: Text(
          'Patient Details',
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
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildDetailContainer('Name', patientDetails['name']),
              _buildDetailContainer('Age', patientDetails['age'].toString()),
              _buildDetailContainer('Blood Type', patientDetails['bloodType']),
              _buildDetailContainer('Gender', patientDetails['bloodType']),
              _buildDetailContainer('Allergies', patientDetails['allergies']),
              ExpansionTile(
                  tilePadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  backgroundColor: AppColors.rest,
                  collapsedBackgroundColor: AppColors.rest,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  collapsedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  maintainState: true,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  expandedAlignment: Alignment.bottomLeft,
                  childrenPadding: EdgeInsets.only(bottom: 10.h, left: 12.w),
                  title: Text(
                    'Illness History',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textMain,
                    ),
                  ),
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Time :' ' 12:00'),
                        Text('Phone Number: +998914309090'),
                        Text('Parcel number :' 'qweqw'),
                        Text('Problem topic: Lorem ipsum'),
                        Text('Comment: Lorem ipsum'),
                      ],
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailContainer(String label, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.rest,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
