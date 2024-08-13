import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/buttons/action_button.dart';
import 'package:med_card/lib/doc_root_page/bloc/doctor_bloc.dart';
import 'package:med_card/lib/root_patient_page/tabs/more_tab/sign_out_dialog.dart';
import 'package:rive/rive.dart';

class DoctorMoreTab extends StatelessWidget {
  const DoctorMoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 50.h),
                        Text(state.data[index].address),
                        Text(state.data[index].clinic_name),
                        Text(state.data[index].contacts),
                        Text(state.data[index].doctors[index].doctor_birthdate),
                        Text(state.data[index].doctors[index].doctor_fullname),
                        Text(state.data[index].doctors[index].doctor_license_no),
                        Text(state.data[index].doctors[index].doctor_phone),
                        Text(state.data[index].doctors[index].speciality_name.speciality_name),
                        Text(state.data[index].doctors[index].reviews[index].review),
                        Text(state.data[index].doctors[index].reviews[index].rating.toString()),
                        Text(state.data[index].doctors[index].qualifications[index].institution),
                        Text(state.data[index].doctors[index].qualifications[index].qualification),
                        Text(state.data[index].doctors[index].qualifications[index].year_obtained),
                        Text(state.data[index].doctors[index].availabilities[index].day_of_week),
                        Text(state.data[index].doctors[index].availabilities[index].end_time),
                        Text(state.data[index].doctors[index].availabilities[index].start_time),
                        Text(state.data[index].doctors[index].doctor_username.email),
                        Text(state.data[index].doctors[index].doctor_username.username),
                        Text(state.data[index].doctors[index].experiences[index].description),
                        Text(state.data[index].doctors[index].experiences[index].end_year),
                        Text(state
                            .data[index].doctors[index].experiences[index].place_of_experience),
                        Text(state.data[index].doctors[index].experiences[index].position),
                        Text(state.data[index].doctors[index].experiences[index].start_year),
                      ],
                    );
                  }),
            ),
            ActionButton(
              text: 'Sign out',
              onPressed: () {
                signOutDialog(context);
              },
            ),
          ],
        );
      },
    );
  }
}
