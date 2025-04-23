import 'package:calisthenics_gym_app/ui/core/shared_widgets/appbar/appbar_content_provider.dart';
import 'package:calisthenics_gym_app/ui/core/shared_widgets/appbar/calitracker_appbar.dart';
import 'package:calisthenics_gym_app/ui/features/feature_home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:calisthenics_gym_app/router/router.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  final _routes = const [HomeRoute(), WorkoutRoute(), ProfileRoute()];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: _routes,
      builder: (context, child, controller) {
        return Scaffold(
          body: Builder(
            builder: (childContext) {final tabsRouter = AutoTabsRouter.of(context);

              // 1. Get the currently active child router for the selected tab
              final currentChildRouter = tabsRouter.innerRouterOf<StackRouter>(
                tabsRouter.current.name,
              );

              // 2. Recursively find the deepest route
              RouteData? getDeepestRoute(StackRouter router) {
                var current = router;
                while (current.currentChild is StackRouter) {
                  current = current.currentChild as StackRouter;
                }
                return current.topRoute;
              }

              final deepestRoute = currentChildRouter != null
                  ? getDeepestRoute(currentChildRouter)
                  : tabsRouter.topRoute;

              AppBarContentProvider? appBarContent;

              switch (deepestRoute?.name) {
                case 'HomeRoute':
                  appBarContent = HomeScreen() as AppBarContentProvider;
                  break;
              }

              debugPrint('Deepest route: ${deepestRoute?.name}');

              return Column(
                children: [
                  CaliTrackerAppBar(
                    title: appBarContent?.getAppBarTitle() ?? 'Cali Tracker',
                    subtitle: appBarContent?.getAppBarSubtitle() ?? '',
                    actions: appBarContent?.getAppBarActions() ?? [],
                    extraContent: appBarContent?.buildAppBarExtraContent(context),
                    leading:
                        tabsRouter.activeIndex != 0 &&
                                tabsRouter.activeIndex != 1 &&
                                tabsRouter.activeIndex != 2
                            ? const Icon(Icons.arrow_back, color: Colors.white)
                            : null,
                    onLeadingPressed:
                        tabsRouter.activeIndex != 0 &&
                                tabsRouter.activeIndex != 1 &&
                                tabsRouter.activeIndex != 2
                            ? () => context.router.popForced()
                            : null,
                  ),
                  Expanded(child: child),
                ],
              );
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: AutoTabsRouter.of(context).activeIndex,
            onTap: AutoTabsRouter.of(context).setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fitness_center_outlined),
                label: "Workout",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
