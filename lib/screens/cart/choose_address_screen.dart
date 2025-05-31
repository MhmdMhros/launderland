import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launder_land/Providers/order_provider/order_provider.dart';
import 'package:launder_land/models/address_model/address_model.dart';
import 'package:launder_land/models/order_model/order_request_model.dart';
import 'package:launder_land/screens/payment/payment.dart';
import 'package:launder_land/screens/profile/address/saved_addresses_screen.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseAddressScreen extends ConsumerStatefulWidget {
  const ChooseAddressScreen(
      {super.key, required this.amountToPay, required this.carts});
  final double amountToPay;
  final List<CartModel> carts;

  @override
  ConsumerState<ChooseAddressScreen> createState() =>
      _ChooseAddressScreenState();
}

class _ChooseAddressScreenState extends ConsumerState<ChooseAddressScreen> {
  List<AddressModel>? addresses;
  AddressModel selectedPickupAddress = AddressModel();
  AddressModel selectedDropAddress = AddressModel();
  List<String> timeSlots = [];
  String selectedPickupTimeSlot = '';
  String selectedDropTimeSlot = '';

  void getAddresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Operations().getAddresses().then((value) {
      setState(() {
        addresses = value;
        selectedPickupAddress =
            addresses?.isNotEmpty == true ? addresses![0] : AddressModel();
        selectedDropAddress =
            addresses?.isNotEmpty == true ? addresses![0] : AddressModel();
      });
    });
    setState(() {
      timeSlots = prefs.getString('time_slots')?.split(',') ?? [];
      selectedPickupTimeSlot = timeSlots.isNotEmpty ? timeSlots[0] : '';
      selectedDropTimeSlot = timeSlots.isNotEmpty ? timeSlots[0] : '';
    });
  }

  @override
  void initState() {
    super.initState();
    getAddresses();
  }

  @override
  Widget build(BuildContext context) {
    String getNextDayFormatted(int daysToAdd) {
      DateTime today = DateTime.now();
      DateTime nextDay = today.add(Duration(days: daysToAdd));
      DateFormat formatter = DateFormat('dd MM');
      String formattedDate = formatter.format(nextDay);
      return formattedDate;
    }

    Future<void> setAddress() async {
      if (selectedPickupAddress.id != null) {
        ref
            .read(orderProvider.notifier)
            .setAddressId(selectedPickupAddress.id!);
        ref.read(orderProvider.notifier).setMeta(
              Meta(
                location_pickup: selectedPickupAddress,
                location_drop: selectedDropAddress,
                time_drop: getNextDayFormatted(3),
                time_drop_slot: selectedDropTimeSlot,
                time_pickup: getNextDayFormatted(1),
                time_pickup_slot: selectedPickupTimeSlot,
              ),
            );
      }
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(bottom: 60), // Space for the button
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Confirm Location & Time'.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              // Pickup Info Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 20, left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pickup Info',
                      style: TextStyle(
                        color: Color(0xFF00BE78),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Image.asset('assets/images/img_pickupinfo.png')
                  ],
                ),
              ),
              if (addresses?.isNotEmpty == true)
                Center(
                  child: DropdownMenu<AddressModel>(
                    width: 321,
                    label: Text(
                      'Pickup address',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    ),
                    onSelected: (value) {
                      setState(() => selectedPickupAddress = value!);
                    },
                    initialSelection: addresses!.first,
                    dropdownMenuEntries: [
                      ...addresses!.map(
                        (e) => DropdownMenuEntry(value: e, label: e.title!),
                      ),
                    ],
                  ),
                ),
              Center(
                child: SizedBox(
                  width: 321,
                  child: Text(
                    'choose your current location ',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                  width: 321,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Color(0xFF295A66).withValues(alpha: 0.4),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/time_slot.png',
                            width: 35,
                            height: 35,
                          ),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Select Time slot ! ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'choose your suitable slot',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ...timeSlots.map(
                            (e) => ChoiceChip(
                              showCheckmark: false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              selectedColor: Color(0xFF21295A),
                              backgroundColor: Colors.white,
                              onSelected: (value) {
                                setState(() => selectedPickupTimeSlot = e);
                              },
                              label: Text(
                                e,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: selectedPickupTimeSlot == e
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              selected: selectedPickupTimeSlot == e,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              if (addresses?.isNotEmpty == true) const SizedBox(height: 40),

              // Drop Info Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 20, left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Drop Info',
                      style: TextStyle(
                        color: Color(0xFF00BE78),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Image.asset('assets/images/img_dropinfo.png'),
                  ],
                ),
              ),

              if (addresses?.isNotEmpty == true)
                Center(
                  child: DropdownMenu<AddressModel>(
                    width: 321,
                    label: Text(
                      'Drop address',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 12,
                      ),
                    ),
                    onSelected: (value) {
                      setState(() => selectedDropAddress = value!);
                    },
                    initialSelection: addresses!.first,
                    dropdownMenuEntries: [
                      ...addresses!.map(
                        (e) => DropdownMenuEntry(value: e, label: e.title!),
                      ),
                    ],
                  ),
                ),
              Center(
                child: SizedBox(
                  width: 321,
                  child: Text(
                    'choose your current location ',
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              if (addresses?.isEmpty ?? true)
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'No addresses found. Please add one to continue.',
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.add_location_alt),
                        label: const Text('Add Address'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          final currentContext = context;

                          // Close the BottomSheet
                          Navigator.pop(currentContext);

                          // Now safely navigate using the captured context
                          Navigator.push(
                            currentContext,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const SavedAddressesScreen(), // Replace with your actual screen
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              if (addresses?.isNotEmpty == true)
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                    width: 321,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Color(0xFF295A66).withValues(alpha: 0.4),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/time_slot.png',
                              width: 35,
                              height: 35,
                            ),
                            SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Select Time slot ! ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  'choose your suitable slot',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ...timeSlots.map(
                              (e) => ChoiceChip(
                                showCheckmark: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                selectedColor: Color(0xFF21295A),
                                backgroundColor: Colors.white,
                                onSelected: (value) {
                                  setState(() => selectedDropTimeSlot = e);
                                },
                                label: Text(
                                  e,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: selectedDropTimeSlot == e
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                selected: selectedDropTimeSlot == e,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Center(
                child: FilledButton(
                  onPressed: (selectedPickupAddress
                                  .formatted_address?.isNotEmpty ??
                              false) &&
                          (selectedDropAddress.formatted_address?.isNotEmpty ??
                              false) &&
                          selectedPickupTimeSlot.isNotEmpty &&
                          selectedDropTimeSlot.isNotEmpty
                      ? () async {
                          setAddress().then(
                            (value) {
                              if (context.mounted) {
                                pushScreenWithoutNavBar(
                                    context,
                                    PaymentPage(
                                      amountToPay: widget.amountToPay,
                                      carts: widget.carts,
                                    ));
                              }
                            },
                          );
                        }
                      : null,
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    fixedSize: const Size(321, 50),
                    backgroundColor: const Color(0xFF00BE78),
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
