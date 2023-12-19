import '../../../core/utils/usecase.dart';
import '../../repository/web_app_repository.dart';
import '../entity/web_app_theme_params.dart';

class GetWebAppThemeParams extends UseCase<WebAppThemeParams, void> {
  GetWebAppThemeParams({
    required WebAppRepository webAppRepository,
  }) : _webAppRepository = webAppRepository;

  final WebAppRepository _webAppRepository;

  @override
  WebAppThemeParams call(void params) {
    return _webAppRepository.themeParams;
  }
}
