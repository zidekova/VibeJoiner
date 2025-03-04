import 'package:auto_route/auto_route.dart';
import 'package:vibejoiner/routes/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: AuthRoute.page, initial: true),
        AutoRoute(page: StartRoute.page),
        AutoRoute(page: RegistrationRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: ChatlistRoute.page),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: OrderRoute.page),
        AutoRoute(page: SearchRoute.page),
      ];
}
