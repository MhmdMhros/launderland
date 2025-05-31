import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:launder_land/screens/home/home_screen.dart';
import 'package:launder_land/screens/orders/orders_screen.dart';
import 'package:launder_land/screens/profile/profile_screen.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Root extends StatefulWidget {
  const Root({super.key, this.index});

  final int? index;

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  PersistentTabController navController = PersistentTabController();
  bool isLoggedIn = false;

  void userState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      setState(() {
        isLoggedIn = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Operations().getSettings();
    userState();
  }

  @override
  Widget build(BuildContext context) {
    navController = PersistentTabController(initialIndex: widget.index ?? 0);
    final theme = Theme.of(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: PersistentTabView(
        controller: navController,
        navBarHeight: 57,
        popAllScreensOnTapAnyTabs: true,
        popAllScreensOnTapOfSelectedTab: true,
        stateManagement: false,
        tabs: [
          PersistentTabConfig(
            screen: const HomeScreen(),
            item: ItemConfig(
              icon: Icon(Icons.home),
              title: "home".tr(),
              activeForegroundColor: theme.textTheme.bodySmall!.color!,
              textStyle: theme.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          PersistentTabConfig(
            screen: const OrdersScreen(),
            item: ItemConfig(
              // inactiveIcon: Image.asset(
              //   'assets/icons/navBar/ic_orders.png',
              //   width: 30,
              //   height: 30,
              //   color: theme.colorScheme.onSecondary,
              // ),
              icon: Image.asset(
                'assets/icons/navBar/ic_orders.png',
                width: 35,
                height: 35,
              ),
              title: "orders".tr(),
              activeForegroundColor: theme.textTheme.bodySmall!.color!,
              textStyle: theme.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          PersistentTabConfig(
            screen: LoaderOverlay(child: const ProfileScreen()),
            item: ItemConfig(
              icon: Icon(Icons.person),
              title: "account".tr(),
              activeForegroundColor: theme.textTheme.bodySmall!.color!,
              textStyle: theme.textTheme.bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => BottomBar(
          body: (BuildContext context, ScrollController controller) {
            if (navBarConfig.selectedIndex == 0) {
              return HomeScreen();
            } else if (navBarConfig.selectedIndex == 1) {
              return OrdersScreen();
            } else {
              return ProfileScreen();
            }
          },
          hideOnScroll: true,
          barColor: Colors.transparent,
          barDecoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Style1BottomNavBar(
            navBarConfig: navBarConfig,
            navBarDecoration: NavBarDecoration(
              color: theme.colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.circular(30),
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ),
    );
  }
}
