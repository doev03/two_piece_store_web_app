import 'app/app.dart';
import 'app/repository/web_app_repository.dart';
import 'bootstrap.dart';
import 'core/data/data_sources/telegram_web_app_remote_data_source_test.dart';

void main() {
  bootstrap(
    () => App(
      webAppRepository: WebAppRepositoryImpl(
        remoteDataSource: TelegramWebAppRemoteDataSourceTest(),
      ),
    ),
  );
}
