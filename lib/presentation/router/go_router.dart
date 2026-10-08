import 'package:go_router/go_router.dart';
import 'package:servinet_movil/presentation/pages/technicians/announce_page.dart';
import 'package:servinet_movil/presentation/pages/technicians/main_page.dart';
import 'package:servinet_movil/presentation/pages/technicians/profile_page.dart';

import '../pages/login_page.dart';
import '../pages/technicians/instalaciones_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',

  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),

    GoRoute(path: '/technicians', builder: (context, state) => TecnicosPage()),

    GoRoute(
      path: '/technicians/orders',
      builder: (context, state) => TecnicosInstalacionesPage(),
    ),
    GoRoute(
      path: '/technicians/my-profile',
      builder: (context, state) => TecnicosProfilePage(),
    ),
    GoRoute(
      path: '/technicians/advertisements',
      builder: (context, state) => TecnicosAnunciosPage(),
    ),
  ],
);
