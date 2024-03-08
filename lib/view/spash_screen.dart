import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    dataFetch();
    return const Scaffold(
      body: Center(
        child: Text("Git Track",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25)),
      ),
    );
  }

  dataFetch() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil("/ToHome", (route) => false);
    }
  }
}
