import 'package:flutter/material.dart';
import 'package:untitled/util/images.dart';
import '../util/appcolors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int notificationCount;

  const CustomAppBar({super.key, this.notificationCount = 3});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isTablet = constraints.maxWidth >= 600;
        final double height = isTablet ? 72 : 56;
        final double avatarSize = isTablet ? 42 : 36;
        final double iconSize = isTablet ? 28 : 24;

        return Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: avatarSize,
                width: avatarSize,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: Image.asset(AppImages.avatar, fit: BoxFit.cover),
                ),
              ),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    AppImages.notify,
                    height: iconSize,
                    width: iconSize,
                  ),
                  if (notificationCount > 0)
                    Positioned(
                      right: -6,
                      top: -6,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: AppColors.secondarycolor,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minHeight: 18,
                          minWidth: 18,
                        ),
                        child: Center(
                          child: Text(
                            notificationCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
