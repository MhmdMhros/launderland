import 'package:flutter/material.dart';
import 'package:launder_land/models/address_model/address_model.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.address});
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipOval(
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Image.asset(
                'assets/icons/ic_${address.title!.toLowerCase()}.png',
                width: 40,
                height: 40,
              ),
            ),
          ),
          VerticalDivider(
            thickness: 1,
            width: 20,
            color: Colors.grey[400],
            endIndent: 8,
            indent: 8,
          ),
          SizedBox(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.title ?? "",
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  address.formatted_address ?? '',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
