import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/presentation/pages/game_levels_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/settings_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/shop_screen.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CupertinoTabController _tabController;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _tabController = CupertinoTabController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoTabScaffold(
      controller: _tabController,

      tabBar: CupertinoTabBar(
        currentIndex: _selectedIndex,
        activeColor: AppColors.primaryColor,
        inactiveColor: CupertinoColors.white,
        // backgroundColor: CupertinoColors.white.withOpacity(.0),
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.assetsIconsNavbarGame),
            activeIcon: SvgPicture.asset(
              Assets.assetsIconsNavbarGame,
              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Game',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.assetsIconsNavbarShop),
            activeIcon: SvgPicture.asset(
              Assets.assetsIconsNavbarShop,
              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.assetsIconsNavbarSettings),
            activeIcon: SvgPicture.asset(
              Assets.assetsIconsNavbarSettings,
              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
            ),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (_selectedIndex) {
              case 1:
                return ShopScreen();
              case 2:
                return SettingsScreen();
              default:
                return GameLevelsScreen();
            }
          },
        );
      },
    );
  }
}
