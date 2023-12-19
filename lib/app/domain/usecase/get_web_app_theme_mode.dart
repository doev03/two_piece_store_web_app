import 'package:flutter/material.dart';

import '../../../core/utils/usecase.dart';
import '../../repository/web_app_repository.dart';

class GetWebAppThemeMode extends UseCase<ThemeMode, void> {
  GetWebAppThemeMode({
    required WebAppRepository webAppRepository,
  }) : _webAppRepository = webAppRepository;

  final WebAppRepository _webAppRepository;

  @override
  ThemeMode call(void params) {
    return _webAppRepository.isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}
