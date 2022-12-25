import 'package:discus_mobile/config/session.dart';
import 'package:discus_mobile/model/user.dart';
import 'package:discus_mobile/page/error_page.dart';
import 'package:discus_mobile/page/home_page.dart';
import 'package:discus_mobile/page/login_page.dart';
import 'package:discus_mobile/page/register_page.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';

  static GoRouter routerConfig = GoRouter(
    errorBuilder: (context, state) => ErrorPage(
      title: 'Something error',
      description: state.error.toString(),
    ),
    debugLogDiagnostics: true,
    redirect: (context, state) async {
      User? user = await Session.getUser();
      if (user == null) {
        if (state.location == login || state.location == register) {
          return null;
        }
        return login;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => const RegisterPage(),
      )
    ],
  );
}
