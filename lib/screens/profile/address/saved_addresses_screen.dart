import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:launder_land/models/address_model/address_model.dart';
import 'package:launder_land/screens/profile/address/new_address_screen.dart';
import 'package:launder_land/utils/operations.dart';
import 'package:launder_land/widgets/loading.dart';

class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({super.key});

  @override
  State<SavedAddressesScreen> createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
  List<AddressModel>? addresses;

  void getAddresses() async {
    Operations().getAddresses().then((value) {
      setState(() {
        addresses = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getAddresses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewAddressScreen()),
          ).then((value) => getAddresses());
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        title: Text(
          'saved_addresses'.tr(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF222a59),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF222a59)),
      ),
      body: addresses == null
          ? const Loading(image: 'assets/images/empty_address.png')
          : addresses!.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/empty_address.png', height: 110),
                      const SizedBox(height: 20),
                      Text(
                        'No addresses found.'.tr(),
                        style: TextStyle(color: Colors.grey[500]),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListView(
                    children: [
                      const SizedBox(height: 24), // 24px gap below app bar
                      ...addresses!.map((address) => Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: Color(0xFF222a59),
                                      size: 24,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      address.title ?? 'No title',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF222a59),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  address.formatted_address ?? 'No address details',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NewAddressScreen()),
          ).then((value) => getAddresses());
                                        // Handle edit action
                                      },
                                      icon: const Icon(Icons.edit, 
                                          color: Colors.green, size: 16),
                                      label: const Text(
                                        'Edit',
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 14),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        elevation: 0,
                                        side: const BorderSide(color: Colors.green),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
    );
  }
}