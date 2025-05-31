import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:launder_land/models/orders_model.dart';
import 'package:url_launcher/url_launcher_string.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key, required this.order});
  final OrderData order;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    void showOrderBreakDown() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return SafeArea(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(16),
              // height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${widget.order.products![index].vendorProduct!.product!.title} - ${widget.order.products![index].vendorProduct!.product!.categories![0].title}  ',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('x${widget.order.products![index].quantity}',
                                    style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Text('EGP${widget.order.products![index].total!.toDouble()}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      );
                    },
                    itemCount: widget.order.products!.length,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Payment Info',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('EGP${widget.order.subtotal!.toDouble()}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('VAT', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('EGP${widget.order.taxes!.toDouble()}', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery Fee', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('EGP${widget.order.deliveryFee!.toDouble()}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('EGP${widget.order.total!.toDouble()}', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      bottomNavigationBar: Material(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 32, top: 16, left: 20, right: 20),
          color: Theme.of(context).colorScheme.primary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'EGP ${widget.order.total} | ${widget.order.payment!.paymentMethod!.slug!.toUpperCase()}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              OutlinedButton(
                onPressed: showOrderBreakDown,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  fixedSize: Size(120, 35),
                  minimumSize: Size(120, 35),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'View Order',
                      style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    Icon(Icons.keyboard_arrow_down, size: 24, color: Theme.of(context).colorScheme.onSecondary),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Order #${widget.order.id}'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                color: Theme.of(context).colorScheme.primary,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(widget.order.vendor!.mediaurls!.images![0].image!, width: 40)),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.order.vendor!.name!, style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          widget.order.scheduledOn!.split(' ')[0],
                          style: TextStyle(color: Colors.grey[500], fontSize: 12),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        launchUrlString("tel://${widget.order.vendor!.user!.mobileNumber}");
                      },
                      icon: Icon(Icons.phone),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('Order Status', style: TextStyle(color: Colors.grey[500], fontSize: 14)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    EasyStepper(
                      enableStepTapping: false,
                      activeStep: activeStep,
                      disableScroll: true,
                      lineStyle: LineStyle(
                        lineLength: 20,
                        lineSpace: 0,
                        activeLineColor: Colors.deepOrange,
                        defaultLineColor: Colors.grey[400],
                        lineType: LineType.dotted,
                      ),
                      stepShape: StepShape.rRectangle,
                      direction: Axis.vertical,
                      stepRadius: 35,
                      showStepBorder: false,
                      activeStepBorderColor: Colors.deepOrange,
                      borderThickness: 3,
                      internalPadding: 10,
                      padding: EdgeInsets.zero,
                      stepBorderRadius: 20,
                      finishedStepBorderColor: Colors.deepOrange,
                      finishedStepTextColor: Colors.deepOrange,
                      finishedStepBackgroundColor: Colors.deepOrange,
                      activeStepIconColor: Colors.deepOrange,
                      showLoadingAnimation: false,
                      showTitle: false,
                      steps: [
                        EasyStep(
                          customStep: Opacity(
                            opacity: activeStep >= 0 ? 1 : 0.3,
                            child: Image.asset(
                              'assets/icons/order/step_1.png',
                              fit: BoxFit.cover,
                              width: 50,
                            ),
                          ),
                        ),
                        EasyStep(
                          customStep: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Opacity(
                              opacity: activeStep >= 1 ? 1 : 0.3,
                              child: Image.asset(
                                'assets/icons/order/step_2.png',
                                fit: BoxFit.cover,
                                width: 50,
                              ),
                            ),
                          ),
                        ),
                        EasyStep(
                          customStep: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Opacity(
                              opacity: activeStep >= 2 ? 1 : 0.3,
                              child: Image.asset(
                                'assets/icons/order/step_3.png',
                                fit: BoxFit.cover,
                                width: 50,
                              ),
                            ),
                          ),
                        ),
                        EasyStep(
                          customStep: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Opacity(
                              opacity: activeStep >= 3 ? 1 : 0.3,
                              child: Image.asset(
                                'assets/icons/order/step_4.png',
                                fit: BoxFit.cover,
                                width: 50,
                              ),
                            ),
                          ),
                        ),
                        EasyStep(
                          customStep: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Opacity(
                              opacity: activeStep >= 4 ? 1 : 0.3,
                              child: Image.asset(
                                'assets/icons/order/step_5.png',
                                fit: BoxFit.cover,
                                width: 50,
                              ),
                            ),
                          ),
                        ),
                      ],
                      onStepReached: (index) => setState(() => activeStep = index),
                    ),
                    EasyStepper(
                      enableStepTapping: false,
                      disableScroll: true,
                      fitWidth: true,
                      activeStep: activeStep,
                      lineStyle: LineStyle(
                        lineLength: 10,
                        lineSpace: 0,
                        activeLineColor: Colors.transparent,
                        defaultLineColor: Colors.transparent,
                        lineType: LineType.dotted,
                      ),
                      stepShape: StepShape.rRectangle,
                      direction: Axis.vertical,
                      stepRadius: 40,
                      borderThickness: 0,
                      activeStepBorderColor: Colors.deepOrange,
                      padding: EdgeInsets.zero,
                      internalPadding: 0,
                      alignment: Alignment.center,
                      showStepBorder: false,
                      showLoadingAnimation: false,
                      showTitle: false,
                      steps: [
                        EasyStep(
                          customStep: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Confirmed',
                                style: TextStyle(
                                  color: activeStep == 0 ? Colors.deepOrange : Colors.grey[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Confirmed on ${widget.order.scheduledOn!.split(' ')[0]}',
                                style: TextStyle(color: Colors.grey[400], fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        EasyStep(
                          customStep: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Pickup',
                                style: TextStyle(
                                  color: activeStep == 1 ? Colors.deepOrange : Colors.grey[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Make your Laundry ready',
                                style: TextStyle(color: Colors.grey[400], fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        EasyStep(
                          customStep: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Dispatched',
                                style: TextStyle(
                                  color: activeStep == 2 ? Colors.deepOrange : Colors.grey[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'your Laundry is ready for delivery',
                                style: TextStyle(color: Colors.grey[400], fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        EasyStep(
                          customStep: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Out for Delivery',
                                style: TextStyle(
                                  color: activeStep == 3 ? Colors.deepOrange : Colors.grey[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Your Laundry is on the way',
                                style: TextStyle(color: Colors.grey[400], fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        EasyStep(
                          customStep: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Delivered',
                                style: TextStyle(
                                  color: activeStep == 4 ? Colors.deepOrange : Colors.grey[400],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                'Your Laundry is delivered',
                                style: TextStyle(color: Colors.grey[400], fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                      onStepReached: (index) => setState(() => activeStep = index),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}