import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import '../home/home_view.dart';
import 'main_scaffold_view_model.dart';
import '../../product/theme/app_colors.dart';

class MainScaffoldView extends StatelessWidget {
  const MainScaffoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainScaffoldViewModel>.reactive(
      viewModelBuilder: () => MainScaffoldViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: AppColors.primary900,
          body: IndexedStack(
            index: viewModel.currentIndex,
            children: const [HomeView(), Center(child: Placeholder()), Center(child: Placeholder())],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.primary900,
            currentIndex: viewModel.currentIndex,
            onTap: viewModel.setTab,
            selectedItemColor: AppColors.white,
            unselectedItemColor: AppColors.gray600,
            unselectedFontSize: 14,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: NavbarItem.values.map((e) => navbarItem(e, viewModel)).toList(),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem navbarItem(NavbarItem item, MainScaffoldViewModel viewModel) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        item.icon,
        colorFilter: ColorFilter.mode(
          viewModel.currentIndex == item.index ? AppColors.white : AppColors.gray600,
          BlendMode.srcIn,
        ),
      ),
      label: item.label,
    );
  }
}
