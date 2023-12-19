import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/web_app_theme_params.dart';
import '../../domain/usecase/get_web_app_theme_mode.dart';
import '../../domain/usecase/get_web_app_theme_params.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required GetWebAppThemeMode getThemeMode,
    required GetWebAppThemeParams getThemeParams,
  }) : super(
          AppInitial(
            themeMode: getThemeMode(null),
            themeParams: getThemeParams(null),
          ),
        );
}
