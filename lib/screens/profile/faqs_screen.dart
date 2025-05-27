import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:launder_land/models/faqs_model/faqs_model.dart';
import 'package:launder_land/utils/operations.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  List<FaqsModel> faqs = [];
  void getFaqs() async {
    Operations().getFaqs().then(
      (value) {
        setState(() {
          faqs = value;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getFaqs();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('faqs'.tr()),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: theme.colorScheme.secondary,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
            child: ListView.builder(
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: ExpansionTile(
                    collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    iconColor: theme.colorScheme.onSecondary,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    tilePadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    childrenPadding: const EdgeInsets.only(bottom: 20, left: 20),
                    expandedAlignment: Alignment.centerLeft,
                    collapsedIconColor: theme.colorScheme.onSecondary,
                    backgroundColor: theme.colorScheme.primary,
                    collapsedBackgroundColor: theme.colorScheme.primary,
                    title: Text(
                      faqs[index].title!,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      Text(
                        faqs[index].description!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
