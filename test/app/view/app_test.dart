import 'package:flutter_test/flutter_test.dart';
import 'package:two_piece_store_web_app/app/app.dart';
import 'package:two_piece_store_web_app/app/repository/web_app_repository.dart';
import 'package:two_piece_store_web_app/core/data/data_sources/telegram_web_app_remote_data_source_test.dart';
import 'package:two_piece_store_web_app/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(
        App(
          webAppRepository: WebAppRepositoryImpl(
            remoteDataSource: TelegramWebAppRemoteDataSourceTest(),
          ),
        ),
      );
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
