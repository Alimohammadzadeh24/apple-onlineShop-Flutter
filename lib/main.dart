import 'dart:ui';

import 'package:apple_online_shop/Constant/color.dart';
import 'package:apple_online_shop/data/dependency_Injection/di.dart';
import 'package:apple_online_shop/data/repository/authentication_repository.dart';
import 'package:apple_online_shop/screens/basket_screen.dart';
import 'package:apple_online_shop/screens/category_screen.dart';
import 'package:apple_online_shop/screens/home_screen.dart';
import 'package:apple_online_shop/screens/profile_screen.dart';
import 'package:apple_online_shop/data/utils/auth_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getItInit();
  runApp(const Application());
}

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'SM'),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: CustomColors.backgroundColor,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity),
                ElevatedButton(
                  onPressed: () async {
                    await AuthenticationRepository()
                        .login('Alimmz1', '12345678');
                  },
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () async => AuthManager.logout(),
                  child: const Text('Logout'),
                ),
                const SizedBox(height: 20),
                ValueListenableBuilder(
                  valueListenable: AuthManager.authChangeNotifire,
                  builder: (context, value, child) {
                    if (value == null || value.isEmpty) {
                      return const Text('لطفا وارد شوید');
                    } else {
                      return const Text('شما وارد شده اید');
                    }
                  },
                )
              ],
            ),
            // IndexedStack(
            //   index: selectedBottomNavigationBarIndex,
            //   children: getScreens(),
            // ),
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
                      child:
                          Image.asset('assets/images/icon_basket_active.png'),
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
                      child:
                          Image.asset('assets/images/icon_profile_active.png'),
                    ),
                    label: 'پروفایل',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
