import 'package:go_router/go_router.dart';
import 'package:maphi_contas/core/ui/screens/my_home_page.dart';
import 'package:maphi_contas/auth/ui/screens/login_screen.dart';

class AppRouter {
  static final _router = GoRouter(
    // initialLocation: '/home',
    routes: [
      GoRoute(path: '/', builder: (context, state) => LoginScreen()),
      GoRoute(
        path: '/home',
        builder: (context, state) => MyHomePage(title: "Home"),
      ),
    ],
  );

  static GoRouter get router => _router;
}

// GoRouter configuration
