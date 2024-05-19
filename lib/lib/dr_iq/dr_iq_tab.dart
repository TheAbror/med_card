import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';
import 'package:med_card/core/bottomsheet/primary_loader.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/lib/dr_iq/bloc/dr_iq_bloc.dart';

class DRIQTab extends StatefulWidget {
  const DRIQTab({super.key});

  @override
  State<DRIQTab> createState() => _DRIQTabState();
}

class _DRIQTabState extends State<DRIQTab> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => DrIQBloc(),
        child: BlocBuilder<DrIQBloc, DrIQState>(
          builder: (context, state) {
            if (state.blocProgress == BlocProgress.IS_LOADING) {
              return const PrimaryBottomSheetLoader();
            }
            if (state.blocProgress == BlocProgress.LOADED) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 150.h, left: 16.w, right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: state.drIQResponse.data.map((map) {
                      final entry = map.entries.first;
                      return Text(
                        '${entry.key}: ${entry.value}',
                        style: TextStyle(fontSize: 24),
                        textAlign: TextAlign.start,
                      );
                    }).toList(),
                  ),
                ),
              );
            } else {
              GestureDetector(
                onTap: () {
                  context.read<DrIQBloc>().getDRIQ('elevated body temperature, sweating, chills');
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.chat,
                    size: 56,
                    color: Colors.blue[400],
                  ),
                ),
              );
            }
            return _myTextField(context);
          },
        ),
      ),
    );
  }

  Padding _myTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        children: [
          SizedBox(height: 200),
          Spacer(),
          TextFormField(
            validator: (username) {
              if (username == null || username.isEmpty) {
                return 'Please enter value';
              }
              return null;
            },
            controller: _controller,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              filled: true,

              border: InputBorder.none, // Remove border color
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary, width: 1.w),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.inputField, width: 1.w),
                borderRadius: BorderRadius.circular(12),
              ),
              fillColor: Theme.of(context).colorScheme.surfaceTint,
              hintText: 'DR.IQ ',
              suffixIcon: GestureDetector(
                onTap: () {
                  context.read<DrIQBloc>().getDRIQ(_controller.text);
                  // context.read<DrIQBloc>().getDRIQ('');
                },
                child: Icon(Icons.telegram, color: AppColors.primary),
              ),
            ),
          )
        ],
      ),
    );
  }
}
