import 'package:alfai/core/services/navigation_service.dart';
import 'package:alfai/feature/widgets/center_logo_app_bar.dart';
import 'package:alfai/product/navigate/navigation_enums.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../core/constants/layout_constants.dart';
import '../../../product/theme/app_text_styles.dart';
import '../../../product/theme/app_colors.dart';
import '../../../product/lang/locale_keys.g.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/custom_button.dart';

import 'register_view_model.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      viewModelBuilder: () => RegisterViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: const CenterLogoAppBar(),
          body: Padding(
            padding: LayoutConstants.padding20All,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LayoutConstants.emptyHeight24,
                  LayoutConstants.emptyHeight4,
                  Text(
                    LocaleKeys.register_title.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textXlBold.copyWith(color: AppColors.white),
                  ),
                  LayoutConstants.emptyHeight8,
                  Text(
                    LocaleKeys.register_subtitle.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textMdRegular.copyWith(color: AppColors.gray400),
                  ),
                  LayoutConstants.emptyHeight32,
                  CustomTextField(
                    controller: viewModel.usernameController,
                    hintText: LocaleKeys.register_username_hint.tr(),
                    labelText: LocaleKeys.register_username_label.tr(),
                  ),
                  LayoutConstants.emptyHeight16,
                  CustomTextField(
                    controller: viewModel.emailController,
                    hintText: LocaleKeys.register_email_hint.tr(),
                    labelText: LocaleKeys.register_email_label.tr(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  LayoutConstants.emptyHeight16,
                  CustomTextField(
                    controller: viewModel.passwordController,
                    hintText: LocaleKeys.register_password_hint.tr(),
                    labelText: LocaleKeys.register_password_label.tr(),
                    isPassword: true,
                  ),
                  LayoutConstants.emptyHeight16,
                  CustomTextField(
                    controller: viewModel.passwordRepeatController,
                    hintText: LocaleKeys.register_password_repeat_hint.tr(),
                    labelText: LocaleKeys.register_password_repeat_label.tr(),
                    isPassword: true,
                  ),
                  LayoutConstants.emptyHeight24,
                  CustomButton(
                    text: LocaleKeys.register_button.tr(),
                    onPressed: () {
                      NavigationService.instance.navigateToPage(path: NavigationEnums.postRegister.rawValue);
                    },
                    // enabled: viewModel.isFormValid,
                    enabled: true,
                  ),
                  LayoutConstants.emptyHeight16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.register_already_account.tr(),
                        style: AppTextStyles.textSmRegular.copyWith(color: AppColors.gray400),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          LocaleKeys.register_login.tr(),
                          style: AppTextStyles.textSmBold.copyWith(color: AppColors.purple500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
} 