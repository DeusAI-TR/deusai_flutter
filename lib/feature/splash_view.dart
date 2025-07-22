import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../product/constants/image_constants.dart';
import 'splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (model) => model.startSplashTimer(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: SvgPicture.asset(
              ImageConstants.instance.svgAssets.logo,
              height: 80,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
} 