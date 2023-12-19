import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../catalog/presentation/catalog_page.dart';
import '../../core/data/data_sources/telegram_web_app_remote_data_source_impl.dart';
import '../../core/utils/extensions.dart';
import '../../l10n/l10n.dart';
import '../domain/usecase/get_web_app_theme_mode.dart';
import '../domain/usecase/get_web_app_theme_params.dart';
import '../repository/web_app_repository.dart';
import 'bloc/app_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final webAppRepository = WebAppRepositoryImpl(
          remoteDataSource: TelegramWebAppRemoteDataSourceImpl(),
        );
        return AppCubit(
          getThemeMode: GetWebAppThemeMode(webAppRepository: webAppRepository),
          getThemeParams: GetWebAppThemeParams(webAppRepository: webAppRepository),
        );
      },
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        switch (state) {
          case AppInitial():
            final themeParams = state.themeParams;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light().copyWith(
                primaryColor: themeParams.bgColor.toColor(),
                scaffoldBackgroundColor: themeParams.secondaryBgColor.toColor(),
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
                primaryColor: themeParams.bgColor.toColor(),
                scaffoldBackgroundColor: themeParams.secondaryBgColor.toColor(),
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
              home: const CatalogPage(),
            );
        }
      },
    );
  }
}
