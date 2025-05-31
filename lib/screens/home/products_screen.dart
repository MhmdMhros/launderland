import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:launder_land/Providers/cart_provider/cart_provider.dart';
import 'package:launder_land/models/category_model/category_model.dart';
import 'package:launder_land/screens/auth/please_login.dart';
import 'package:launder_land/models/products_model.dart';
import 'package:launder_land/screens/cart/cart_screen.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:launder_land/widgets/cart_bottom_sheet.dart';
import 'package:launder_land/widgets/loading.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen(
      {super.key, required this.category, required this.categories});
  final CategoryModel category;
  final List<CategoryModel> categories;

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  ProductsModel? products;
  final ScrollController _scrollController = ScrollController();
  final CustomSegmentedController<int> tabController =
      CustomSegmentedController();
  final ScrollController tabScrollController = ScrollController();
  bool isLoggedIn = false;

  void initProducts(CategoryModel category) async {
    try {
      Operations()
          .categoryProducts(categoryId: category.id!.toString(), pageNum: 1)
          .then((value) {
        if (mounted) setState(() => products = value);
      });
    } catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $error')));
      }
    }
  }

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
    initProducts(widget.category);
    _scrollController.addListener(fetchMore);
    tabController.value = widget.categories.indexOf(widget.category);
    Future.delayed(Durations.medium1, () {
      log(tabScrollController.hasClients.toString());
      tabScrollController.animateTo(
          widget.categories.indexOf(widget.category) == 0
              ? 0
              : widget.categories.indexOf(widget.category) * 100,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut);
    });
    userState();
  }

  void fetchMore() {
    if (products!.meta!.currentPage! != products!.meta!.lastPage!) {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Operations()
            .categoryProducts(
                categoryId: widget.category.id.toString(),
                pageNum: products!.meta!.currentPage! + 1)
            .then((value) {
          if (mounted) {
            setState(() {
              products!.meta = value.meta!;
              products!.data!.addAll(value.data!);
            });
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    int cartCount = ref.watch(cartNotifierProvider).getCartCount;

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: DefaultTabController(
        length: widget.categories.length,
        child: Scaffold(
          floatingActionButton: FlutterCart().cartItemsList.isEmpty
              ? null
              : const CartBottomSheet(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            title: Text(
              "order_now".tr(),
              style: const TextStyle(
                color: Color(0xFF222a59),
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF222a59),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              Badge(
                label: Text(cartCount.toString()),
                backgroundColor: const Color(0xFF00BE78),
                padding: const EdgeInsets.all(2),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                offset: const Offset(-10, 2),
                largeSize: 18,
                child: IconButton(
                  padding: const EdgeInsets.only(right: 18),
                  icon: Image.asset(
                    'assets/icons/ic_cart_blk.png',
                    width: 24,
                    height: 24,
                  ),
                  onPressed: () =>
                      pushScreenWithoutNavBar(context, const CartScreen()),
                ),
              ),
            ],
          ),
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                SingleChildScrollView(
                  controller: tabScrollController,
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: CustomSlidingSegmentedControl<int>(
                      initialValue: widget.categories.indexOf(widget.category),
                      innerPadding: EdgeInsets.zero,
                      children: widget.categories
                          .map((e) {
                            var index = widget.categories.indexOf(e);
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              child: Text(
                                e.title!,
                                style: TextStyle(
                                  color: tabController.value == index
                                      ? const Color(0xFFF6F6F6)
                                      : Colors.black.withValues(alpha: 0.4),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          })
                          .toList()
                          .asMap(),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      controller: tabController,
                      thumbDecoration: BoxDecoration(
                        color: const Color(0xFF00BE78),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      curve: Curves.easeInToLinear,
                      onValueChanged: (v) {
                        setState(() => products = null);
                        initProducts(widget.categories[v]);
                        log(v.toString());
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "exclusive_vat".tr(),
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ),
                Expanded(
                  child: products == null
                      ? const Loading(image: 'assets/images/empty_products.png')
                      : products != null &&
                              products!.data != null &&
                              products!.data!.isEmpty
                          ? _buildEmptyState()
                          : GridView.builder(
                              controller: _scrollController,
                              padding: const EdgeInsets.all(16.0),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.75,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: products!.data!.length,
                              itemBuilder: (context, index) {
                                final product = products!.data![index];
                                final inCart = ref
                                    .watch(cartNotifierProvider)
                                    .getCartItems
                                    .any((element) =>
                                        element.productId ==
                                        product.vendorProducts![0].id
                                            .toString());
                                final count = inCart
                                    ? ref
                                        .watch(cartNotifierProvider)
                                        .getCartItems
                                        .firstWhere((element) =>
                                            element.productId ==
                                            product.vendorProducts![0].id
                                                .toString())
                                        .quantity
                                    : 0;
                                return _buildProductCard(
                                  product: product,
                                  inCart: inCart,
                                  count: count,
                                  isLoggedIn: isLoggedIn,
                                  ref: ref,
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/whatsapp.svg',
            height: 200,
          ),
          SizedBox(
            width: 200,
            child: Text(
              'Contact us on WhatsApp for more details',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: () {
              final text = "Request from app - ${widget.category.title}";
              final url =
                  "https://wa.me/${widget.category.meta!.number}/?text=$text";
              launchUrlString(url);
              log(widget.category.meta!.number.toString());
            },
            style: FilledButton.styleFrom(
              fixedSize: const Size(185, 50),
              minimumSize: const Size(185, 50),
              backgroundColor: const Color(0xFF222a59),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Contact us now',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/whatsapp_logo.svg',
                  height: 20,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required Product product,
    required bool inCart,
    required int count,
    required bool isLoggedIn,
    required WidgetRef ref,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    width: 135,
                    height: 135,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: ClipOval(
                      child: (product.mediaUrls?.images?[0].image != null &&
                              product.mediaUrls!.images![0].image!.isNotEmpty &&
                              Uri.tryParse(product.mediaUrls!.images![0].image!)
                                      ?.hasAbsolutePath ==
                                  true)
                          ? CachedNetworkImage(
                              imageUrl: product.mediaUrls!.images![0].image!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Image.asset('assets/images/placeholder.png'),
                            )
                          : Image.asset('assets/images/placeholder.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: inCart
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // Space between elements
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFF00BE78), // Background color
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                onPressed: () =>
                                    _handleDecrement(ref, product, count),
                                icon: Icon(
                                  count == 1
                                      ? Icons.delete_outline
                                      : Icons.remove,
                                  color: Colors.white,
                                  size: 18, // Decreased icon size
                                ),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 5),
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFF00BE78), // Background color
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                count.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    const Color(0xFF00BE78), // Background color
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: IconButton(
                                onPressed: () => ref
                                    .read(cartNotifierProvider.notifier)
                                    .incrementQuantity(product),
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18, // Decreased icon size
                                ),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          margin: const EdgeInsets.only(
                              right: 12), // تحريك الزر لليمين
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                spreadRadius: 1,
                                blurRadius: 1, // حجم الظل
                                offset: const Offset(4, 6), // تحريك الظل
                              ),
                            ],
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: ElevatedButton(
                            key: const ValueKey<bool>(false),
                            onPressed: isLoggedIn
                                ? () => ref
                                    .read(cartNotifierProvider.notifier)
                                    .addToCart(product)
                                : () => pushReplacementWithoutNavBar(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PleaseLogin())),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF00BE78),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              elevation: 4,
                            ),
                            child: Text(
                              "add_to_basket".tr(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.title ?? "T-Shirt",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xFF222a59),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "EGP ${product.price ?? 0.00}",
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleDecrement(WidgetRef ref, Product product, int count) {
    if (count == 1) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Remove Item'.tr()),
          content: Text('Are you want to sure to delete this item?'.tr()),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the buttons horizontally
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                      color:
                          Color(0xFF222a59), // Background color of the button
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Cancel'.tr()),
                    ),
                  ),
                  const SizedBox(width: 16), // Add space between buttons
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: MediaQuery.sizeOf(context).height * 0.05,
                    decoration: BoxDecoration(
                      color: const Color(
                          0xFF00BE78), // Background color of the button
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ref
                            .read(cartNotifierProvider.notifier)
                            .removeFromCartWithProduct(product);
                      },
                      child: Text(
                        'Remove'.tr(),
                        style: const TextStyle(
                            color: Colors
                                .white), // Text color for the Remove button
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      ref.read(cartNotifierProvider.notifier).decrementQuantity(product);
    }
  }
}
