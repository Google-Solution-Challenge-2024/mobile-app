import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:solution_app/core/config/custom_theme_extension.dart';
import 'package:solution_app/core/service-locator/service_locator_manager.dart';
import 'package:solution_app/feature/home/ui/page/home_page.dart';
import 'package:solution_app/feature/profile/ui/page/profile_page.dart';
import 'package:solution_app/feature/search/ui/page/search_page.dart';
import 'package:solution_app/feature/slider/bloc/bloc/slider_bloc.dart';
import 'package:solution_app/feature/slider/ui/pages/slider_page.dart';
import 'package:solution_app/feature/stats/ui/page/stats_page.dart';
import 'package:solution_app/navigation/auth_navigation.dart';

enum BottomBar { home, stats, search, profile }

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  BottomBar _currentBar = BottomBar.home;
  final Map<BottomBar, Widget> _navigators = {
    BottomBar.home: const HomePage(),
    BottomBar.stats: const StatsPage(),
    BottomBar.search: const SearchPage(),
    BottomBar.profile: const ProfilePage(),
  };

  void selectPage(BottomBar newSelectedBar) {
    setState(() {
      _currentBar = newSelectedBar;
    });
  }

  @override
  void initState() {
    globalSL<SliderBloc>().add(InitSliderEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SliderBloc, SliderState>(
      bloc: globalSL<SliderBloc>(),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ShowSliderState) {
          return const SliderPage();
        }
        return Scaffold(
          body: _buildBody(),
          bottomNavigationBar: _buildBottomNavBar(),
        );
      },
    );
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildPage(BottomBar.home),
        _buildPage(BottomBar.stats),
        _buildPage(BottomBar.search),
        _buildPage(BottomBar.profile),
      ],
    );
  }

  Widget _buildPage(BottomBar bottomBar) {
    return Offstage(
        offstage: _currentBar != bottomBar, child: _navigators[bottomBar]!);
  }

  Widget _buildBottomNavBar() {
    final CustomThemeExtension theme = CustomThemeExtension.of(context);
    return BottomNavigationBar(
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: _currentBar.index,
      type: BottomNavigationBarType.fixed,
      backgroundColor: theme.backgroundColor,
      elevation: 10,
      onTap: (index) => selectPage(BottomBar.values[index]),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/home.svg",
            width: 22.w,
            color: _currentBar == BottomBar.home ? theme.primaryColor : null,
          ),
          label: "Rating",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/stats.svg",
            width: 30.w,
            color: _currentBar == BottomBar.stats ? theme.primaryColor : null,
          ),
          label: "Rating",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/search.svg",
            width: 22.w,
            color: _currentBar == BottomBar.search ? theme.primaryColor : null,
          ),
          label: "Rating",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            "assets/icons/profile.svg",
            width: 22.w,
            color: _currentBar == BottomBar.profile ? theme.primaryColor : null,
          ),
          label: "Rating",
        ),
      ],
    );
  }
}
