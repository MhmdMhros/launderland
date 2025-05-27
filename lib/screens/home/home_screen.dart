import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cart/cart.dart';
import 'package:launder_land/models/banner_model/banner_model.dart';
import 'package:launder_land/models/category_model/category_model.dart';
import 'package:launder_land/screens/auth/proceed_screen.dart';
import 'package:launder_land/screens/auth/login_screen.dart';
import 'package:launder_land/screens/home/widgets/banners.dart';
import 'package:launder_land/screens/cart/cart_screen.dart';
import 'package:launder_land/screens/profile/wallet/wallet_screen.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/categories.dart';

class OfferModel {
  final String imageUrl;
  final String title;
  final String description;

  OfferModel({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) {
    return OfferModel(
      imageUrl: json['image_url']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeIndex = 0;
  String userName = '';
  int walletBalance = 0;
  List<BannerModel>? banners;
  List<CategoryModel>? categories;
  List<OfferModel>? offers;
  bool isLoading = true;

  void getWalletBalance() async {
    Operations().getWalletBalance().then((balance) {
      if (mounted) {
        setState(() {
          walletBalance = balance!;
        });
      }
    });
  }

  Future<void> initHome() async {
    setState(() {
      isLoading = true;
    });

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final fetchedBanners = await Operations().homeBanners();
      final fetchedCategories = await Operations().homeCategories();
      final fetchedOffers = await Operations().getOffers();

      if (mounted) {
        setState(() {
          banners = fetchedBanners;
          categories = fetchedCategories;
          offers =
              fetchedOffers.map((json) => OfferModel.fromJson(json)).toList();
          userName = prefs.getString('userName') ?? '';
        });
      }
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('error_fetching_data'.tr())),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> handleAddMoney() async {
    pushScreen(context, screen: const WalletScreen(), withNavBar: false);
  }

  @override
  void initState() {
    super.initState();
    initHome();
    getWalletBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          systemNavigationBarColor: Colors.white,
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 12.0, right: 20, left: 15),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/Logo.png',
                          height: 44,
                          width: 44,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName.isEmpty
                                  ? 'launderland'.tr()
                                  : 'Welcome Back!'.tr(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF212958),
                              ),
                            ),
                            Text(
                              userName.isEmpty ? 'welcome'.tr() : userName,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xFF212958),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        if (userName.isNotEmpty)
                          GestureDetector(
                            onTap: () => pushScreen(
                              context,
                              screen: const CartScreen(),
                              withNavBar: false,
                            ),
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/icons/Vector.png',
                                  height: 24,
                                  width: 24,
                                ),
                                if (FlutterCart().cartLength > 0)
                                  Positioned(
                                    right: 0,
                                    top: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                      ),
                                      constraints: const BoxConstraints(
                                        minWidth: 16,
                                        minHeight: 16,
                                      ),
                                      child: Text(
                                        FlutterCart().cartLength.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Banners(banners: banners ?? []),
                  const SizedBox(height: 20),
                  if (userName.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/ewallet.png',
                              height: 45,
                              width: 45,
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'available_balance'.tr(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  'EGP ${walletBalance.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF212958),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: handleAddMoney,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF212958),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                              ),
                              child: Text('add_money'.tr()),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/user_account.png',
                            height: 80,
                            width: 80,
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'welcome'.tr(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF21295A),
                                ),
                              ),
                              Text(
                                'login or register'.tr(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF212958),
                                ),
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () => pushScreen(
                                      context,
                                      screen: const LoginScreen(),
                                      withNavBar: false,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF21295A),
                                      fixedSize: const Size(110, 31),
                                    ),
                                    child: Text('login'.tr()),
                                  ),
                                  const SizedBox(width: 8),
                                  OutlinedButton(
                                    onPressed: () => pushScreen(
                                      context,
                                      screen: const ProceedScreen(),
                                      withNavBar: false,
                                    ),
                                    style: OutlinedButton.styleFrom(
                                      side: const BorderSide(
                                          color: Color(0xFF21295A)),
                                      foregroundColor: const Color(0xFF21295A),
                                      fixedSize: const Size(110, 31),
                                    ),
                                    child: Text('register'.tr()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  const SizedBox(height: 20),
                  if (offers != null && offers!.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'offers'.tr(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 220,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: offers!.length,
                              itemBuilder: (context, index) {
                                final offer = offers![index];
                                return Container(
                                  width: 148,
                                  margin: const EdgeInsets.only(right: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.2),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        ),
                                        child: offer.imageUrl.isNotEmpty
                                            ? Image.network(
                                                offer.imageUrl,
                                                height: 88,
                                                width: 148,
                                                fit: BoxFit.cover,
                                              )
                                            : Image.asset(
                                                'assets/images/sunset_offer.png',
                                                height: 88,
                                                width: 148,
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              offer.title,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              offer.description,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            ElevatedButton(
                                              onPressed: () {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                      content: Text(
                                                          'subscribed_to_offer'
                                                              .tr())),
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xFFFF5722),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 12,
                                                        vertical: 6),
                                              ),
                                              child: Text(
                                                'subscribe_now'.tr(),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore launderland'.tr(),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF212958),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Categories(categories: categories ?? []),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ],
              ),
            ),
    );
  }
}
