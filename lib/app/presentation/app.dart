import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/extensions.dart';
import '../../l10n/l10n.dart';
import '../../router/app_router.dart';
import '../domain/usecase/get_web_app_theme_mode.dart';
import '../domain/usecase/get_web_app_theme_params.dart';
import '../repository/web_app_repository.dart';
import 'bloc/app_cubit.dart';

class App extends StatelessWidget {
  const App({
    required this.webAppRepository,
    super.key,
  });

  final WebAppRepository webAppRepository;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        return AppCubit(
          getThemeMode: GetWebAppThemeMode(webAppRepository: webAppRepository),
          getThemeParams: GetWebAppThemeParams(webAppRepository: webAppRepository),
        );
      },
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  AppView({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        switch (state) {
          case AppInitial():
            final themeParams = state.themeParams;
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light().copyWith(
                primaryColor: themeParams.buttonColor.toColor(),
                scaffoldBackgroundColor: themeParams.bgColor.toColor(),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeParams.buttonColor.toColor(),
                    textStyle: TextStyle(
                      color: themeParams.buttonTextColor.toColor(),
                    ),
                  ),
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    backgroundColor: themeParams.buttonColor.toColor(),
                    textStyle: TextStyle(
                      color: themeParams.buttonTextColor.toColor(),
                    ),
                  ),
                ),
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                    color: themeParams.textColor.toColor(),
                  ),
                  backgroundColor: themeParams.bgColor.toColor(),
                ),
              ),
              darkTheme: ThemeData.dark().copyWith(
                colorScheme: const ColorScheme.dark().copyWith(
                  brightness: Brightness.dark,
                  primary: themeParams.buttonColor.toColor(),
                  onPrimary: themeParams.buttonTextColor.toColor(),
                  secondary: themeParams.secondaryBgColor.toColor(),
                  onSecondary: themeParams.textColor.toColor(),
                  error: const Color.fromRGBO(230, 77, 69, 1),
                  onError: Colors.white,
                  background: themeParams.bgColor.toColor(),
                  onBackground: themeParams.textColor.toColor(),
                  surface: themeParams.secondaryBgColor.toColor(),
                  onSurface: themeParams.textColor.toColor(),
                  tertiary: themeParams.hintColor.toColor(),
                ),
                primaryColor: themeParams.buttonColor.toColor(),
                scaffoldBackgroundColor: themeParams.bgColor.toColor(),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: themeParams.buttonColor.toColor(),
                    textStyle: TextStyle(
                      color: themeParams.buttonTextColor.toColor(),
                    ),
                  ),
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    backgroundColor: themeParams.buttonColor.toColor(),
                    textStyle: TextStyle(
                      color: themeParams.buttonTextColor.toColor(),
                    ),
                  ),
                ),
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                    color: themeParams.textColor.toColor(),
                  ),
                  backgroundColor: themeParams.bgColor.toColor(),
                ),
              ),
              themeMode: state.themeMode,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: _appRouter.config(),
            );
        }
      },
    );
  }
}
