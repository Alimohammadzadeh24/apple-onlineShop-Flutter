import 'dart:ui';
import 'package:apple_online_shop/Constant/color.dart';
import 'package:apple_online_shop/screens/basket_screen.dart';
import 'package:apple_online_shop/screens/category_screen.dart';
import 'package:apple_online_shop/screens/home_screen.dart';
import 'package:apple_online_shop/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  var selectedBottomNavigationBarIndex = 0;

  List<Widget> getScreens() {
    return [
      const HomeScreen(),
      const CategoryScreen(),
      const BasketScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomColors.backgroundColor,
        body: IndexedStack(
          index: selectedBottomNavigationBarIndex,
          children: getScreens(),
        ),
        bottomNavigationBar: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
            child: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  selectedBottomNavigationBarIndex = index;
                });
              },
              currentIndex: selectedBottomNavigationBarIndex,
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: const TextStyle(
                color: CustomColors.blue,
                fontFamily: 'SB',
                fontSize: 12,
              ),
              unselectedLabelStyle: const TextStyle(
                color: CustomColors.grey,
                fontFamily: 'SB',
                fontSize: 12,
              ),
              elevation: 0,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Image.asset('assets/images/icon_home.png'),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Image.asset('assets/images/icon_home_active.png'),
                  ),
                  label: 'خانه',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Image.asset('assets/images/icon_category.png'),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child:
                        Image.asset('assets/images/icon_category_active.png'),
                  ),
                  label: 'دسته بندی ها',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Image.asset('assets/images/icon_basket.png'),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Image.asset('assets/images/icon_basket_active.png'),
                  ),
                  label: 'سبد خرید',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Image.asset('assets/images/icon_profile.png'),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Image.asset('assets/images/icon_profile_active.png'),
                  ),
                  label: 'پروفایل',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
