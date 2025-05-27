// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:launder_land/screens/auth/proceed_screen.dart';
import 'package:launder_land/screens/auth/login_screen.dart';

class PleaseLogin extends StatelessWidget {
  const PleaseLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Colors.white, // Fixed to white background
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/bg.png', // Add an asset with yellow/green circles
              ),
              fit: BoxFit.cover,
              alignment: Alignment.topRight,
            ),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/home-logo.png', // Update to your logo asset
                  fit: BoxFit.cover,
                  height: 150,
                ),
                SizedBox(height: 56),
                Text(
                  'WELCOME!',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'LOGIN OR REGISTER NEW ACCOUNT',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(4, 8),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF21295A),
                        fixedSize: Size(364, 55),
                        maximumSize: Size(364, 55),
                        minimumSize: Size(364, 55),
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        )),
                    child: Text('Login'),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 8, // حجم الظل
                        offset: const Offset(4, 8), // تحريك الظل
                      ),
                    ],
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProceedScreen()));
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color(0xFF21295A)),
                      fixedSize: Size(364, 55),
                      maximumSize: Size(364, 55),
                      minimumSize: Size(364, 55),
                      foregroundColor: Color(0xFF21295A),
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    child: Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
