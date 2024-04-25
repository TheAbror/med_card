import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:med_card/core/buttons/action_button.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/core/router/app_routes.dart';
import 'package:med_card/gen/assets.gen.dart';
import '../splash_page/bloc/splash_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppUpdatesView extends StatelessWidget {
  const AppUpdatesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return Container(
          color: AppColors.float,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Spacer(),
              Assets.images.logo4x.image(),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      state.appVersionData.showMaintanance
                          ? Assets.images.stores.maintenance.svg(width: 170.w)
                          : Platform.isAndroid
                              ? Assets.images.stores.googlePlay.image(width: 80.w)
                              : Assets.images.stores.iosAppStore.image(width: 80.w),
                      SizedBox(height: 40.h),
                      Text(
                        state.appVersionData.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textMain,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        state.appVersionData.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.textMain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (!state.appVersionData.showMaintanance)
                Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: Column(
                    children: [
                      ActionButton(
                        text: 'Update now'.toUpperCase(),
                        onPressed: () => _launchUrl(Platform.isAndroid
                            ? state.appVersionData.androidStoreUrl
                            : state.appVersionData.iosStoreUrl),
                      ),
                      if (state.buildNumber < state.latestAppVersion)
                        Padding(
                          padding: EdgeInsets.only(top: 10.h),
                          child: ActionButton(
                            isFilled: false,
                            text: 'Not now'.toUpperCase(),
                            onPressed: () {
                              // context.read<SplashBloc>().setupInitialSettings();
                              context.go('/${AppRoutes.rootPage}');
                            },
                          ),
                        ),
                      SizedBox(height: 60.h),
                    ],
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}

Future<void> _launchUrl(String url) async {
  final Uri parsedUrl = Uri.parse(url);

  if (!await launchUrl(parsedUrl)) {
    throw Exception('Could not launch $parsedUrl');
  }
}
