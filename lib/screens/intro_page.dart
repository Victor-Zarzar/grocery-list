import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_list/features/app_theme.dart';
import 'package:grocery_list/features/assets_app.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppTheme.thirdColor : AppTheme.primaryColor,
      body: SizedBox(
        height: myHeight,
        width: myWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ImageOne.asset(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "introtext".tr(),
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                  textStyle: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode
                        ? FontTextColor.secondaryColor
                        : FontTextColor.primaryColor,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: SizedBox(
                height: 45,
                width: 140,
                child: GFButton(
                  shape: GFButtonShape.square,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppPage(),
                      ),
                    );
                  },
                  text: "introtexttwo".tr(),
                  textStyle: TextStyle(
                    color: isDarkMode
                        ? FontTextColor.primaryColor
                        : FontTextColor.secondaryColor,
                    fontFamily: GoogleFonts.notoSerif().fontFamily,
                    fontSize: 11,
                  ),
                  color: isDarkMode
                      ? ButtonColor.secondaryColor
                      : ButtonColor.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
