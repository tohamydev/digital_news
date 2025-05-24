import 'package:digital_news/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home_news/presentation/screens/home_news_screen.dart';
import '../../features/home_news/presentation/screens/stories_news_screen.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../features/home_news/presentation/logic/home_news_cubit.dart';
import 'dart:ui';

import '../../features/profile/profile_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _colorController;
  late Animation<Color?> _backgroundColorAnimation;
  late Animation<Color?> _iconColorAnimation;
  late Animation<Color?> _textColorAnimation;

  final List<Widget> _screens = [
    const HomeNewsScreen(),
    const StoriesNewsScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _colorController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _backgroundColorAnimation = ColorTween(
      begin: AppColors.card,
      end: Colors.black.withOpacity(0.8),
    ).animate(_colorController);

    _iconColorAnimation = ColorTween(
      begin: AppColors.icon,
      end: Colors.white,
    ).animate(_colorController);

    _textColorAnimation = ColorTween(
      begin: AppColors.icon,
      end: Colors.white,
    ).animate(_colorController);
  }

  @override
  void dispose() {
    _colorController.dispose();
    super.dispose();
  }

  void _updateColorAnimation() {
    if (_currentIndex == 1) {
      _colorController.forward();
    } else {
      _colorController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getit<HomeNewsCubit>(),
      child: Scaffold(
        body: Stack(
          children: [
            // Screens
            _screens[_currentIndex],

            Positioned(
              left: 32.w,
              right: 32.w,
              bottom: 24.h,
              child: AnimatedBuilder(
                animation: _colorController,
                builder: (context, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    decoration: BoxDecoration(
                      color: _backgroundColorAnimation.value,
                      borderRadius: BorderRadius.circular(20.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6.r,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _NavBarItem(
                          icon: Icons.home,
                          label: 'Home',
                          selected: _currentIndex == 0,
                          onTap: () {
                            setState(() {
                              _currentIndex = 0;
                              _updateColorAnimation();
                            });
                          },
                          iconColor: _iconColorAnimation.value,
                          textColor: _textColorAnimation.value,
                        ),
                        _NavBarItem(
                          icon: Icons.view_agenda,
                          label: 'Stories',
                          selected: _currentIndex == 1,
                          onTap: () {
                            setState(() {
                              _currentIndex = 1;
                              _updateColorAnimation();
                            });
                          },
                          iconColor: _iconColorAnimation.value,
                          textColor: _textColorAnimation.value,
                        ),
                        _NavBarItem(
                          icon: Icons.person_outline,
                          label: 'Profile',
                          selected: _currentIndex == 2,
                          onTap: () {
                            setState(() {
                              _currentIndex = 2;
                              _updateColorAnimation();
                            });
                          },
                          iconColor: _iconColorAnimation.value,
                          textColor: _textColorAnimation.value,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const _NavBarItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.primary.withOpacity(0.15)
                  : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: selected ? AppColors.primary : iconColor,
              size: 24.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            label,
            style: TextStyle(
              color: selected ? AppColors.primary : textColor,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

