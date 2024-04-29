import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_card/core/bloc_progress/bloc_progress.dart';
import 'package:med_card/core/colors/app_colors.dart';
import 'package:med_card/core/router/app_routes.dart';
import 'package:med_card/gen/assets.gen.dart';
import 'bloc/auth_bloc.dart';
import 'textfields/sign_in_password_field.dart';
import 'textfields/sign_in_username_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/dialog_success_failure.dart';
import 'widgets/lang_item.dart';
import 'widgets/navigation_utils.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

//todo3
  final _usernameController = TextEditingController(text: '200000001');
  final _passwordController = TextEditingController(text: '123456');

  bool isPasscodeOnDefault = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) async {
            if (state.blocProgress == BlocProgress.IS_SUCCESS) {
              NavigationUtils.navigateToNextRouteByAccountType(
                context,
                state.accountType,
              );
            } else if (state.blocProgress == BlocProgress.FAILED) {
              showMessage(
                state.failureMessage,
                isError: true,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          LangItem('En'),
                          LangItem('Ru'),
                          LangItem('Uz'),
                        ],
                      ),
                      SizedBox(height: 50.h),
                      Center(
                        child: Assets.icons.figmaIcons.logo2.svg(
                          colorFilter: ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                          height: 140,
                        ),
                      ),
                      Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'Enter credentials',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        'ID',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      SignInUsernameField(usernameController: _usernameController),
                      SizedBox(height: 24.h),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      SignInPasswordField(passwordController: _passwordController),
                      const Spacer(),
                      _ContinueButton(context, state),
                      SizedBox(height: 50.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  GestureDetector _ContinueButton(BuildContext context, AuthState state) {
    return GestureDetector(
      onTap: () {
        final username = _usernameController.text.trim();
        final password = _passwordController.text.trim();
        if (_formKey.currentState!.validate()) {
          context.read<AuthBloc>().signIn(username, password);
          Navigator.pushNamed(context, AppRoutes.rootPatient);
        }
      },
      child: Container(
        height: 48.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
          border: Border.all(color: AppColors.primary, width: 1),
        ),
        child: Center(
          child: state.blocProgress == BlocProgress.IS_LOADING
              ? SizedBox(
                  width: 25.w,
                  height: 25.w,
                  child: CircularProgressIndicator(
                    color: AppColors.float,
                    strokeWidth: 2.w,
                  ),
                )
              : Text(
                  'Continue',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 15.sp,
                    color: AppColors.float,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
