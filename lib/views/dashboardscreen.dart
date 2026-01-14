import 'package:flutter/material.dart';
import 'package:untitled/reusable/reusableappbar.dart';
import 'package:untitled/util/appcolors.dart';
import 'package:untitled/views/homescreen.dart';

import '../util/images.dart';
import 'livescreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    LiveScreen(),
    Center(child: Text('')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _screens[_index],
      bottomNavigationBar: AppBottomNav(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isTablet = constraints.maxWidth >= 600;
        final double iconSize = isTablet ? 40 : 40;
        final double height = isTablet ? 90 : 72;
        final double indicatorWidth = isTablet ? 14 : 12;

        return Container(
          height: height,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: indicatorWidth,
                    height: 6,
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? AppColors.secondarycolor
                          : Colors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  );
                }),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onTap(index),
                      child: Image.asset(
                        _getIcon(index, currentIndex == index),
                        width: iconSize,
                        height: iconSize,
                        fit: BoxFit.fill,
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getIcon(int index, bool active) {
    switch (index) {
      case 0:
        return active ? AppImages.nav1fill : AppImages.nav1;
      case 1:
        return active ? AppImages.nav2fill : AppImages.nav2;
      case 2:
        return active ? AppImages.nav3fill : AppImages.nav3;
      case 3:
        return active ? AppImages.nav4fill : AppImages.nav4;
      default:
        return AppImages.nav1;
    }
  }
}
