import 'package:etrack_mobile_connector_app/modules/splash/controllers/splash_controller.dart';
import 'package:etrack_mobile_connector_app/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              width: screenSize.width * 0.8,
              height: screenSize.height * 0.4,
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText("E-Track", color: Colors.white, size: 32.0, isBold: true),
                  AppText("Mobile Connector", color: Colors.white, size: 28.0, isBold: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _init() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final splashController = Provider.of<SplashController>(context, listen: false);
      splashController.navigateToMain(context);
    });
  }
}
