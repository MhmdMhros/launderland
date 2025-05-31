import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cart/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launder_land/Providers/theme_provider/theme_provider.dart';
import 'package:launder_land/root.dart';
import 'package:launder_land/theme/dark_theme.dart';
import 'package:launder_land/theme/light_theme.dart';
import 'package:launder_land/utils/nav_key.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  FlutterCart cart = FlutterCart();
  await cart.initializeCart(isPersistenceSupportEnabled: true);
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (value) {
      FirebaseAppCheck.instance.activate(
        androidProvider: AndroidProvider.playIntegrity,
        appleProvider: AppleProvider.appAttest,
      );
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
        } else {
          user.getIdToken().then((value) {
            if (value != null && value.isNotEmpty) {
              SharedPreferences.getInstance().then((prefs) {
                prefs.setString('userPhone', user.phoneNumber!);
                log('token :${prefs.getString('token')} ');
              });
            }
          });
          // print(user);
        }
      });
    },
  );

  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        assetLoader: JsonAssetLoader(),
        child: MainApp(),
      ),
    ),
  );
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  String theme = 'light';
  void setTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedTheme = prefs.getString('theme');
    if (savedTheme == null) {
      theme = await ref.watch(themeProvider.future);
      await prefs.setString('theme', theme);
    } else {
      setState(() {
        theme = savedTheme;
      });
      ref.watch(themeProvider.notifier).setTheme(theme);
    }
  }

  @override
  void initState() {
    super.initState();
    setTheme();
  }

  @override
  Widget build(BuildContext context) {
    final themeAsyncValue = ref.watch(themeProvider);
    theme = themeAsyncValue.when(
      data: (theme) => theme,
      loading: () => 'light',
      error: (err, stack) => 'light',
    );

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      navigatorKey: NavKey.navKey,
      home: LoaderOverlay(child: const Root()),
      theme: theme == 'light' ? LightTheme.buildTheme() : DarkTheme.buildTheme(),
    );
  }
}
