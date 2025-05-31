import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/cart.dart';
import 'package:launder_land/models/orders_model.dart';
import 'package:launder_land/root.dart';
import 'package:launder_land/screens/auth/please_login.dart';
import 'package:launder_land/screens/home/home_screen.dart';
import 'package:launder_land/screens/orders/order_details_screen.dart';
import 'package:launder_land/utils/api_services.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:launder_land/widgets/custom_alert_dialog.dart';
import 'package:launder_land/widgets/loading.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isLoggedIn = false;
  OrdersModel? orders;

  void getOrders() async {
    Operations().getOrders().then((value) {
      if (value != null && mounted) {
        setState(() {
          orders = value;
          orders!.orderData!.sort((a, b) => a.status == 'cancelled' ? 1 : -1);
        });
      }
    });
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
    getOrders();
    userState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Orders',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            FlutterCart().clearCart();
            pushReplacementWithoutNavBar(
                context, MaterialPageRoute(builder: (context) => Root()));
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.white,
        child: isLoggedIn
            ? orders == null
                ? const Loading(image: 'assets/images/empty_orders.png')
                : orders!.orderData!.isEmpty
                    ? _buildEmptyOrdersView()
                    : RefreshIndicator(
                        onRefresh: () async {
                          setState(() {
                            orders = null;
                          });
                          getOrders();
                          userState();
                        },
                        child: ListView.builder(
                          itemCount: orders!.orderData!.length,
                          itemBuilder: (context, index) {
                            final order = orders!.orderData![index];
                            return _buildOrderCard(order);
                          },
                        ),
                      )
            : _buildLoginPrompt(),
      ),
    );
  }

  Widget _buildOrderCard(order) {
    Color getStatusColor(String status) {
      switch (status.toLowerCase()) {
        case 'ongoing':
          return Colors.purple;
        case 'completed':
          return Colors.green;
        case 'canceled':
          return Colors.red;
        case 'refunded':
          return Colors.grey;
        default:
          return Colors.blue;
      }
    }

    return InkWell(
      onTap: () {
        // Navigate to order details screen
        pushScreenWithoutNavBar(context, OrderDetailsScreen(order: order));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey, // Border color
            width: 1, // Border width
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(0, 2)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  DateFormat('dd MMMM yyyy')
                      .format(DateTime.parse(order.scheduledOn!)),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: getStatusColor(order.status!),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    order.status!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(order.scheduledOn!.split(' ')[1],
                style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            const SizedBox(height: 8),
            Text("Order #${order.id}",
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Column(
              children: order.products!.map<Widget>((e) {
                return Row(
                  children: [
                    Text(
                      'x${e.quantity} ${e.vendorProduct!.product!.title}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "EGP ${e.vendorProduct!.price!.toStringAsFixed(1)}",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                );
              }).toList(),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ORDER TOTAL",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
                Text(
                  "EGP ${order.total.toStringAsFixed(1)}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            if (order.status == 'new')
              TextButton(
                onPressed: () {
                  CustomAlertDialog().showCustomDialog(
                    context: context,
                    title: 'Cancel Order',
                    subtitle: 'Are you sure you want to cancel this order?',
                    onConfirm: () async {
                      ApiService().cancelOrder(order.id!).then((value) {
                        setState(() {
                          getOrders();
                          userState();
                        });
                      });
                    },
                  );
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                ),
                child: Text('Cancel'),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyOrdersView() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/empty_orders.png', height: 110),
          const SizedBox(height: 20),
          Text(
            'No Orders Yet!',
            style: TextStyle(fontSize: 16, color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginPrompt() {
    return Center(
      child: GestureDetector(
        onTap: () {
          pushScreenWithoutNavBar(context, PleaseLogin());
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/empty_orders.png', height: 110),
            const SizedBox(height: 20),
            Text(
              'Kindly log in to view your orders',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
          ],
        ),
      ),
    );
  }
}
