import 'package:flutter/material.dart';
import 'package:med_card/core/router/app_routes.dart';

import '../../../../splash_page/auth_status/account_type.dart';
import 'dialog_success_failure.dart';

class NavigationUtils {
  static void navigateToNextRouteByAccountType(
    BuildContext context,
    AccountType accountType,
  ) {
    switch (accountType) {
      case AccountType.superAdmin:
      case AccountType.director:
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRoutes.rootDoctor,
          (route) => false,
        );
        break;
      case AccountType.staff:
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.rootDoctor, (route) => false);
        break;
      case AccountType.student:
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.rootPatient, (route) => false);
        break;

      // to be deleted
      case AccountType.unknown:
        Navigator.pushNamedAndRemoveUntil(context, AppRoutes.rootDoctor, (route) => false);
        break;
      //
      default:
        showMessage(
          'You must have either student or director role',
          isError: true,
        );
        break;
    }
  }
}
