import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:launder_land/models/products_model.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
    required this.onPressed,
    required this.increment,
    required this.decrement,
    required this.inCart,
    required this.count,
  });
  final Product product;
  final void Function() onPressed;
  final void Function() increment;
  final void Function() decrement;
  final bool inCart;
  final int count;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 10,
      minVerticalPadding: 18,
      minLeadingWidth: 10,
      leading: CachedNetworkImage(
        imageUrl: product.mediaUrls!.images![0].image!,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title!,
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          const SizedBox(height: 5),
          Text(
            '${'egp'.tr()} ${product.price!.toDouble()}0',
            style: Theme.of(context).textTheme.bodySmall!,
          ),
        ],
      ),
      trailing: inCart
          ? Container(
              height: 30,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF222a59)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    onPressed: decrement,
                    icon: const Icon(Icons.remove, size: 14),
                  ),
                  Text(
                    count.toString(),
                    style: TextStyle(fontSize: 12),
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    padding: EdgeInsets.zero,
                    onPressed: increment,
                    icon: const Icon(Icons.add, size: 14),
                  ),
                ],
              ),
            )
          : FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF222a59),
                fixedSize: const Size(80, 0),
                minimumSize: const Size(80, 30),
              ),
              child: Text('add'.tr(), style: TextStyle(fontSize: 12, color: Colors.white)),
            ),
    );
  }
}
