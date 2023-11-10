import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodie_flutter/gen/assets.gen.dart';
import 'package:foodie_flutter/pages/welcome_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ));

    Timer(const Duration(milliseconds: 2600), () {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ));

      Route route =
          MaterialPageRoute(builder: (context) => const WelcomePage());
      Navigator.pushAndRemoveUntil(
          context, route, (Route<dynamic> route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.images.background.path,
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
          Center(
            child: Image.asset(Assets.images.logo1.path, width: 160.0),
          ),
        ],
      ),
      // body: Container(
      //   width: size.width,
      //   height: size.height,
      //   width: double.infinity,
      //   height: double.infinity,
      //   alignment: Alignment.center,
      //   decoration: BoxDecoration(
      //     image: DecorationImage(
      //       // image: Image.asset(Assets.images.background.path).image,
      //       image: AssetImage(Assets.images.background.path),
      //       fit: BoxFit.fill,
      //     ),
      //   ),
      //   child: Image.asset(
      //     Assets.images.logo1.path,
      //     width: 160.0,
      //   ),
      // ),
    );
  }
}
