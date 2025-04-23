import 'package:auto_route/auto_route.dart';
import 'package:calisthenics_gym_app/ui/features/feature_auth/auth_gate.dart';
import 'package:calisthenics_gym_app/ui/features/feature_home/home_screen.dart';
import 'package:calisthenics_gym_app/ui/features/feature_profile/profile_screen.dart';
import 'package:calisthenics_gym_app/ui/features/feature_workout/workout_screen.dart';
import 'package:calisthenics_gym_app/ui/features/feature_browse/browse_screen.dart';
import 'package:calisthenics_gym_app/ui/features/feature_main/main_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        page: MainRoute.page,
        initial: true,
        children: [
          AutoRoute(page: HomeRoute.page, path: 'home'),
          AutoRoute(page: WorkoutRoute.page, path: 'workout', children: [
            AutoRoute(page: WorkoutBrowseRoute.page, path: 'browse'),
          ]),
          AutoRoute(page: ProfileRoute.page, path: 'profile'),
        ]
    ),
  ];

  @override
  // TODO: implement guards
  List<AutoRouteGuard> get guards => super.guards;
}