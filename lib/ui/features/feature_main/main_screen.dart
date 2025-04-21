import 'package:calisthenics_gym_app/ui/core/shared_widgets/appbar/appbar_content_widget.dart';
import 'package:calisthenics_gym_app/ui/core/shared_widgets/appbar/calitracker_appbar.dart';
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
            builder: (childContext) {
              final appBarContent = AppBarContentWidget.of(childContext);
              final tabsRouter = AutoTabsRouter.of(context);

              return Column(
                children: [
                  CaliTrackerAppBar(
                    title: appBarContent?.title ?? 'Cali Tracker',
                    subtitle: appBarContent?.subtitle ?? '',
                    actions: appBarContent?.actions ?? [],
                    extraContent: appBarContent?.extraContent,
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
