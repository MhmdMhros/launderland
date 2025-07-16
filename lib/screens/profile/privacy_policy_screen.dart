import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  String privacyAndPolicy = '''
Privacy Policy and Terms of Use  
Effective Date: May 8, 2025  

Welcome to Launderland!  
Your privacy and trust are important to us. This document outlines both our **Privacy Policy** and **Terms of Use**, explaining how we collect, use, and protect your information, as well as your responsibilities when using our application.

---

**1. Information We Collect**  
We may collect the following types of information:  
- **Personal Information:** Such as your name, email address, and phone number when you register or interact with certain features.  
- **Usage Data:** Including pages visited, features used, and session duration to improve our services.  
- **Device Information:** Like your device type, operating system, and IP address for technical optimization and security.

---

**2. How We Use Your Information**  
Your data is used to:  
- Provide and personalize our services.  
- Improve user experience and app performance.  
- Communicate important updates, offers, or service changes.  
- Ensure security, prevent fraud, and enforce policies.

---

**3. Data Sharing and Disclosure**  
We do not sell or rent your personal data. Your information may only be shared:  
- With trusted third-party services helping us operate the app (e.g., payment providers).  
- If required by law or to protect our legal rights.  
- With your consent.

---

**4. Data Security**  
We use industry-standard encryption and secure servers to protect your personal data. However, no system is 100% secure, and we cannot guarantee absolute safety.

---

**5. Your Rights**  
You have the right to:  
- Access the information we hold about you.  
- Request corrections or deletion of your data.  
- Withdraw your consent at any time.  
To exercise these rights, please contact us at: **info@launderland.com**

---

**6. Terms of Use**  
By using our application, you agree to the following terms:  
- You will use the app in compliance with all applicable laws and regulations.  
- You will not misuse the app or attempt to gain unauthorized access to any part of it.  
- Launderland reserves the right to suspend or terminate accounts that violate these terms.  
- All content and services provided by the app are the property of Launderland and may not be copied or redistributed without permission.

---

**7. Changes to This Policy**  
We may update this Privacy Policy and Terms of Use from time to time. All changes will be posted in the app and take effect immediately upon publication.

---

**8. Contact Us**  
If you have any questions or concerns regarding our privacy practices or terms of use, please reach out to us at:  
📧 **info@launderland.com**

''';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        appBar: AppBar(title: Text('privacy'.tr())),
        body: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/Logo.png',
                      width: MediaQuery.of(context).size.height * 0.125,
                    ),
                  ),
                ),
                privacyAndPolicy.isEmpty
                    ? Container(
                        color: theme.colorScheme.primary,
                        height: MediaQuery.of(context).size.height,
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 32),
                        child: Text(privacyAndPolicy),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
