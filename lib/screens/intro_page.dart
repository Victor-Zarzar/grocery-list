import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_list/features/app_theme.dart';
import 'package:grocery_list/features/assets_app.dart';
import 'package:grocery_list/screens/app_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppTheme.thirdColor : AppTheme.primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                child: ImageOne.asset(),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "introtext".tr(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoSerif(
                    textStyle: TextStyle(
                      fontSize: 24,
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
                  width: 280,
                  child: GFButton(
                    shape: GFButtonShape.pills,
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
                          ? FontTextColor.secondaryColor
                          : FontTextColor.secondaryColor,
                      fontFamily: GoogleFonts.notoSerif().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    color: isDarkMode
                        ? ButtonColor.primaryColor
                        : ButtonColor.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
