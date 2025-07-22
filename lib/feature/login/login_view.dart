import 'package:alfai/feature/widgets/center_logo_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';
import 'login_view_model.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../widgets/google_button.dart';
import '../widgets/form_divider.dart';
import '../../core/constants/layout_constants.dart';
import '../../product/theme/app_text_styles.dart';
import '../../product/theme/app_colors.dart';
import '../../product/lang/locale_keys.g.dart';
import '../../core/services/navigation_service.dart';
import '../../product/navigate/navigation_enums.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
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
                  // Başlık
                  Text(
                    LocaleKeys.login_title.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.displayXsSemibold.copyWith(color: AppColors.white),
                  ),
                  LayoutConstants.emptyHeight8,
                  // Açıklama
                  Text(
                    LocaleKeys.login_subtitle.tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyles.textMdRegular.copyWith(color: AppColors.gray400),
                  ),
                  LayoutConstants.emptyHeight32,
                  // Mail
                  CustomTextField(
                    controller: viewModel.emailController,
                    hintText: LocaleKeys.login_email_hint.tr(),
                    labelText: LocaleKeys.login_email_label.tr(),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  LayoutConstants.emptyHeight20,
                  // Parola
                  CustomTextField(
                    controller: viewModel.passwordController,
                    hintText: LocaleKeys.login_password_hint.tr(),
                    labelText: LocaleKeys.login_password_label.tr(),
                    isPassword: true,
                  ),
                  LayoutConstants.emptyHeight8,
                  // Şifremi unuttum
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.login_forgot_password.tr(),
                        style: AppTextStyles.textSmBold.copyWith(color: AppColors.purple500),
                      ),
                    ),
                  ),
                  LayoutConstants.emptyHeight20,
                  // Giriş yap butonu
                  CustomButton(
                    text: LocaleKeys.login_button.tr(),
                    onPressed: () {},
                    isLoading: false,
                    enabled: viewModel.emailController.text.isNotEmpty && viewModel.passwordController.text.isNotEmpty,
                  ),
                  LayoutConstants.emptyHeight16,
                  // Divider
                  const FormDivider(),
                  LayoutConstants.emptyHeight16,
                  // Google ile giriş yap
                  GoogleButton(
                    onPressed: () {},
                    text: LocaleKeys.login_google.tr(),
                  ),
                  LayoutConstants.emptyHeight16,
                  // Kayıt ol
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.login_no_account.tr(),
                        style: AppTextStyles.textSmRegular.copyWith(color: AppColors.gray400),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationService.instance.navigateToPage(path: NavigationEnums.preRegister.rawValue);
                        },
                        child: Text(
                          LocaleKeys.login_register.tr(),
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