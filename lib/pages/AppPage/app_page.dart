import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_list/components/AppTheme/app_theme.dart';
import 'package:grocery_list/components/DarkMode/dark_mode.dart';
import 'package:grocery_list/pages/HomePage/home_page.dart';
import 'package:grocery_list/pages/ListPage/list_page.dart';
import 'package:grocery_list/pages/SettingsPage/settings_page.dart';
import 'package:provider/provider.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Consumer<UiProvider>(
      builder: (context, notifier, child) {
        return Scaffold(
          body: SizedBox(
            height: myHeight,
            width: myWidth,
            child: GFTabBarView(
              controller: tabController,
              children: const <Widget>[
                HomePage(),
                ListPage(),
                SettingsPage(),
              ],
            ),
          ),
          bottomNavigationBar: GFTabBar(
            labelPadding: EdgeInsets.zero,
            length: 5,
            tabBarHeight: 70,
            controller: tabController,
            tabBarColor:
                notifier.isDark ? AppTheme.thirdColor : AppTheme.primaryColor,
            labelColor: notifier.isDark
                ? FontTextColor.secondaryColor
                : FontTextColor.primaryColor,
            indicatorColor: notifier.isDark
                ? FontTextColor.secondaryColor
                : FontTextColor.primaryColor,
            labelStyle: GoogleFonts.notoSerif(
              textStyle: const TextStyle(fontSize: 10),
            ),
            tabs: [
              Tab(
                icon: const Icon(
                  Icons.home,
                  size: 18,
                ),
                child: Text(
                  'home'.tr(),
                  style: GoogleFonts.notoSerif(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Tab(
                icon: const Icon(
                  Icons.list,
                  size: 18,
                ),
                child: Text(
                  'list'.tr(),
                  style: GoogleFonts.notoSerif(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Tab(
                icon: const Icon(
                  Icons.settings,
                  size: 18,
                ),
                child: Text(
                  'settings'.tr(),
                  style: GoogleFonts.notoSerif(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
