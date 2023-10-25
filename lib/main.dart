import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:portsmouth_bloc/blocs/centerboard/centerboard_cubit.dart';
import 'package:portsmouth_bloc/blocs/search/search_cubit.dart';
import 'package:portsmouth_bloc/pages/centerboard_page.dart';
import 'package:portsmouth_bloc/pages/definition_screen.dart';
import 'package:portsmouth_bloc/pages/home_screen.dart';
import 'package:portsmouth_bloc/pages/keelboat_screen.dart';
import 'package:portsmouth_bloc/pages/multihull_screen.dart';
import 'package:portsmouth_bloc/pages/offshore_screen.dart';
import 'package:portsmouth_bloc/pages/settings_screen.dart';
import 'package:portsmouth_bloc/repositories/centerboard_repository.dart';
import 'package:portsmouth_bloc/utilities/theme.dart';

void main() {
  runApp(MyApp());
}

// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'centerboard_screen',
          builder: (BuildContext context, GoRouterState state) {
            return CenterboardScreen();
          },
        ),
        GoRoute(
          path: 'multihull_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const MultihullScreen();
          },
        ),
        GoRoute(
          path: 'keelboat_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const KeelboatScreen();
          },
        ),
        GoRoute(
          path: 'offshore_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const OffshoreScreen();
          },
        ),
        GoRoute(
          path: 'definition_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const DefinitionScreen();
          },
        ),
        GoRoute(
          path: 'settings_screen',
          builder: (BuildContext context, GoRouterState state) {
            return const SettingsScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CenterboardCubit>(
          create: (context) => CenterboardCubit(
            repository: CenterboardRepository(
              Dio(),
            ),
          ),
        ),
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        title: 'Flutter Demo',
        theme: appTheme,
      ),
    );
  }
}
