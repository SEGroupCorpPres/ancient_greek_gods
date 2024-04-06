import 'package:ancient_greek_gods/core/constants/colors.dart';
import 'package:ancient_greek_gods/features/presentation/pages/game_levels_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/settings_screen.dart';
import 'package:ancient_greek_gods/features/presentation/pages/shop_screen.dart';
import 'package:ancient_greek_gods/features/presentation/widgets/home_screen_bottom_tab_item.dart';
import 'package:ancient_greek_gods/generated/assets.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _selectedIndex = 0;
  int _selectedTab = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex, keepPage: false);
  }

  void _onItemTapped(int index) {
      _selectedIndex = index;
    setState(() {
    });
  }

  List<Widget> _pages() => [
        const GameLevelsScreen(),
        const ShopScreen(),
        const SettingsScreen(),
      ];

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
          ),
          SizedBox(
            width: size.width,
            height: size.height * .9,
            child: PageView(
              onPageChanged: _onItemTapped,
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              children: _pages(),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  BottomTabItem(
                    icon: Assets.assetsIconsNavbarGame,
                    title: 'game',
                    onPressed: () {
                      _onItemTapped(0);
                      setState(() {
                        _selectedTab = _selectedIndex;
                      });
                      _pageController.animateToPage(
                        _selectedIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    bgColor: _selectedIndex == 0 ? AppColors.primaryColor : AppColors.selectedBtnColor,
                  ),
                  BottomTabItem(
                    icon: Assets.assetsIconsNavbarShop,
                    title: 'shop',
                    onPressed: () {
                      _onItemTapped(1);
                      setState(() {
                        _selectedTab = 1;
                      });
                      _pageController.animateToPage(
                        _selectedIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    bgColor: _selectedIndex == 1 ? AppColors.primaryColor : AppColors.selectedBtnColor,
                  ),
                  BottomTabItem(
                    icon: Assets.assetsIconsNavbarSettings,
                    title: 'settings',
                    onPressed: () {
                      _onItemTapped(2);
                      setState(() {
                        _selectedTab = 2;
                      });
                      _pageController.animateToPage(
                        _selectedIndex,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    bgColor: _selectedIndex == 2 ? AppColors.primaryColor : AppColors.selectedBtnColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
