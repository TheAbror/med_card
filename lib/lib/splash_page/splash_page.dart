import 'package:med_card/core/router/app_routes.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/gen/assets.gen.dart';
import 'package:med_card/lib/splash_page/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../app_updates_page/app_updates_view.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.signInPage,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, SplashState>(
      listener: (context, state) {
        if ('a' == 'a') {
          context.go('/${AppRoutes.rootPatient}');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          body: state.showAppUpdatesPage ? const AppUpdatesView() : _SplashView(),
        );
      },
    );
  }
}

class _SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Spacer(),
        Center(
          child: Assets.images.logo4x.image(
            width: 260.w,
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 50.h),
        const Center(
          child: CircularProgressIndicator(color: AppColors.float),
        ),
        const Spacer(),
      ],
    );
  }
}
