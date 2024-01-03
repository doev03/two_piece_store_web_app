import '../../core/data/data_sources/telegram_web_app_remote_data_source.dart';
import '../domain/entity/web_app_theme_params.dart';

abstract class WebAppRepository {
  bool get isDarkMode;

  WebAppThemeParams get themeParams;

  bool get isSupported;
}

class WebAppRepositoryImpl implements WebAppRepository {
  WebAppRepositoryImpl({
    required TelegramWebAppRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final TelegramWebAppRemoteDataSource _remoteDataSource;

  @override
  bool get isDarkMode => _remoteDataSource.colorScheme == 'dark';

  @override
  bool get isSupported => _remoteDataSource.platform.toLowerCase() != 'unknown';

  @override
  WebAppThemeParams get themeParams {
    final dto = _remoteDataSource.themeParams;
    return WebAppThemeParams(
      bgColor: dto.bgColor,
      textColor: dto.textColor,
      hintColor: dto.hintColor,
      linkColor: dto.linkColor,
      buttonColor: dto.buttonColor,
      buttonTextColor: dto.buttonTextColor,
      secondaryBgColor: dto.secondaryBgColor,
      accentTextColor: dto.accentTextColor,
    );
  }
}
