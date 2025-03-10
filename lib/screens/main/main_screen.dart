import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vibejoiner/routes/app_router.gr.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
        routes: [
          const HomeRoute(),
          const ProfileRoute(),
          const ChatlistRoute(),
          const SearchRoute(),
          const OrderRoute()
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.euro),
                  label: '',
                ),
              ],
            ),
          );
        });
  }
}
