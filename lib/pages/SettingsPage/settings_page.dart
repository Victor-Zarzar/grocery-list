import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_list/components/AppTheme/app_theme.dart';
import 'package:grocery_list/components/DarkMode/dark_mode.dart';
import 'package:grocery_list/pages/AboutPage/about_page.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Scaffold(
          appBar: GFAppBar(
            backgroundColor:
                notifier.isDark ? AppTheme.thirdColor : AppTheme.primaryColor,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              'settings'.tr(),
              style: GoogleFonts.notoSerif(
                textStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: notifier.isDark
                      ? FontTextColor.secondaryColor
                      : FontTextColor.primaryColor,
                ),
              ),
            ),
          ),
          body: Container(
            color:
                notifier.isDark ? AppTheme.thirdColor : AppTheme.primaryColor,
            child: SizedBox(
              height: myHeight,
              width: myWidth,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ListTile(
                      trailing: Switch(
                        activeColor: SwitchColor.primaryColor,
                        inactiveTrackColor: SwitchColor.secondaryColor,
                        value: notifier.isDark,
                        onChanged: (value) => notifier.changeTheme(),
                      ),
                      leading: const Icon(
                        Icons.dark_mode,
                        size: 20,
                      ),
                      title: Text(
                        'darkmode'.tr(),
                        style: GoogleFonts.notoSerif(
                          textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: notifier.isDark
                                ? FontTextColor.secondaryColor
                                : FontTextColor.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      size: 20,
                    ),
                    title: Text(
                      'notifications'.tr(),
                      style: GoogleFonts.notoSerif(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: notifier.isDark
                              ? FontTextColor.secondaryColor
                              : FontTextColor.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.info,
                      size: 20,
                    ),
                    title: Text(
                      'about'.tr(),
                      style: GoogleFonts.notoSerif(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: notifier.isDark
                              ? FontTextColor.secondaryColor
                              : FontTextColor.primaryColor,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AboutPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
