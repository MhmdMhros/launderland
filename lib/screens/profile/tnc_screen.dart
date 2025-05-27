import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:launder_land/utils/operations.dart';

class TncScreen extends StatefulWidget {
  const TncScreen({super.key});

  @override
  State<TncScreen> createState() => _TncScreenState();
}

class _TncScreenState extends State<TncScreen> {
  String terms = '';
  void getTerms() async {
    Operations().getSettings().then(
      (value) {
        setState(() {
          terms = value.firstWhere((element) => element.key == 'terms').value!;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getTerms();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(title: Text('tnc'.tr())),
        body: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/Logo.png',
                      width: MediaQuery.of(context).size.height * 0.125,
                    ),
                  ),
                ),
                terms.isEmpty
                    ? Container(
                        color: theme.colorScheme.primary,
                        height: MediaQuery.of(context).size.height,
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                        child: Text(terms),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
