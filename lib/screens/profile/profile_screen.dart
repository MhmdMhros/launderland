// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:basic_utils/basic_utils.dart';
import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_cart/cart.dart';
import 'package:launder_land/screens/auth/please_login.dart';
import 'package:launder_land/screens/cart/cart_screen.dart';
import 'package:launder_land/screens/profile/app_settings_screen.dart';
import 'package:launder_land/screens/profile/faqs_screen.dart';
import 'package:launder_land/screens/profile/address/saved_addresses_screen.dart';
import 'package:launder_land/screens/profile/privacy_policy_screen.dart';
import 'package:launder_land/screens/profile/tnc_screen.dart';
import 'package:launder_land/screens/profile/wallet/wallet_screen.dart';
import 'package:launder_land/utils/operations.dart' as utils_operations;
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoggedIn = false;
  String userName = '';
  String phoneNumber = '';

  void userState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token != null && token.isNotEmpty) {
      setState(() {
        isLoggedIn = true;
        userName = prefs.getString('userName') ?? '';
        phoneNumber = prefs.getString('userPhone') ?? '';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    userState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          easy.tr('Account'),
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xFF222a59),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (isLoggedIn)
            Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color(0xFF222a59),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartScreen()),
                    );
                  },
                ),
                if (FlutterCart().cartLength > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: Text(
                        FlutterCart().cartLength.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // Profile Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromARGB(255, 216, 216, 216),
                        width: 1,
                      ),
                    ),
                    child: Image.asset(
                      'assets/icons/person.png',
                      width: 32,
                      height: 32,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isLoggedIn
                                  ? StringUtils.capitalize(userName,
                                      allWords: true)
                                  : easy.tr('Hey Guest'),
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF222a59),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              isLoggedIn
                                  ? phoneNumber
                                  : easy.tr('Kindly Login'),
                              style: TextStyle(
                                fontSize: 12,
                                color: isLoggedIn
                                    ? Colors.black54
                                    : Colors.grey[500],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Settings List
            Expanded(
              child: ListView(
                children: [
                  _buildSettingsTile(
                    assetIconPath: 'assets/icons/profile/location.png',
                    title: easy.tr('saved_addresses'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => isLoggedIn
                              ? const SavedAddressesScreen()
                              : const PleaseLogin(),
                        ),
                      );
                    },
                  ),
                  _buildSettingsTile(
                    assetIconPath: 'assets/icons/profile/ewallet.png',
                    title: easy.tr('wallet'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => isLoggedIn
                              ? const WalletScreen()
                              : const PleaseLogin(),
                        ),
                      );
                    },
                  ),
                  _buildSettingsTile(
                    assetIconPath: 'assets/icons/profile/terms.png',
                    title: easy.tr('tnc'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TncScreen()),
                      );
                    },
                  ),
                  _buildSettingsTile(
                    assetIconPath: 'assets/icons/profile/privacy-policy.png',
                    title: easy.tr('privacy'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PrivacyPolicyScreen()),
                      );
                    },
                  ),
                  _buildSettingsTile(
                    assetIconPath: 'assets/icons/profile/profaq.png',
                    title: easy.tr('faqs'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FaqsScreen()),
                      );
                    },
                  ),
                  _buildSettingsTile(
                    assetIconPath: 'assets/icons/profile/global.png',
                    title: easy.tr('select_language'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AppSettingsScreen()),
                      );
                    },
                  ),
                  _buildSettingsTile(
                    icon: Icons.logout,
                    assetIconPath: 'assets/icons/profile/logout.png',
                    title: isLoggedIn ? easy.tr('logout') : easy.tr('login'),
                    onTap: () async {
                      if (isLoggedIn) {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/icons/profile/logout.png',
                                    height: 70,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    easy.tr('LOGOUT'),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Color(0xFF222a59),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    easy.tr('Are you sure you want to logout?'),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF222a59),
                                          ),
                                          child: Text(
                                            easy.tr('No'),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            Navigator.pop(context);
                                            await utils_operations.Operations()
                                                .logout(context: context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF00BE78),
                                          ),
                                          child: Text(
                                            easy.tr('Yes'),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PleaseLogin()),
                        );
                      }
                    },
                  ),
                  if (isLoggedIn)
                    _buildSettingsTile(
                      icon: Icons.delete,
                      assetIconPath: 'assets/icons/delete.png',
                      title: easy.tr('delete_account'),
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset(
                                    'assets/icons/delete.png', // أيقونة حذف الحساب
                                    height: 70,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    easy.tr('DELETE ACCOUNT'),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    easy.tr(
                                        'Are you sure you want to delete your account?'),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[700],
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xFF222a59),
                                          ),
                                          child: Text(
                                            easy.tr('No'),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () async {
                                            await utils_operations.Operations()
                                                .deleteAccountU2(
                                              context: context,
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.deepOrangeAccent,
                                          ),
                                          child: Text(
                                            easy.tr('Yes'),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                ],
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    IconData? icon,
    String? assetIconPath,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 342,
      height: 54,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (assetIconPath != null)
                  Image.asset(
                    assetIconPath,
                    width: 28,
                    height: 28,
                  )
                else if (icon != null)
                  Icon(
                    icon,
                    color: const Color(0xFF222a59),
                    size: 28,
                  ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF222a59),
                  ),
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
