
import '../dto/web_app_theme_params.dart';

/*final theme = {
  'bg_color': const Color(0xFF212d3b),
  'section_bg_color': const Color(0xFF1d2733),
  'secondary_bg_color': const Color(0xFF151e27),
  'text_color': const Color(0xFFffffff),
  'hint_color': const Color(0xFF7d8b99),
  'link_color': const Color(0xFF5eabe1),
  'button_color': const Color(0xFF50a8eb),
  'button_text_color': const Color(0xFFffffff),
  'header_bg_color': const Color(0xFF242d39),
  'accent_text_color': const Color(0xFF64b5ef),
  'section_header_text_color': const Color(0xFF79c4fc),
  'subtitle_text_color': const Color(0xFF7b8790),
  'destructive_text_color': const Color(0xFFee686f),
};*/

abstract class TelegramWebAppRemoteDataSource {
  String get initData;

  String get version;

  String get platform;

  String get colorScheme;

  String get headerColor;

  String get backgroundColor;

  bool get isClosingConfirmationEnabled;

  bool get isExpanded;

  double? get viewportHeight;

  double? get viewportStableHeight;

  WebAppThemeParamsDTO get themeParams;

  Future<void> ready();

  Future<void> expand();

  Future<void> close();

  Future<void> enableClosingConfirmation();

  Future<void> disableClosingConfirmation();

  Future<void> sendData(dynamic data);

  Future<void> isVersionAtLeast(version);

  Future<void> setHeaderColor(String color);

  Future<void> setBackgroundColor(String color);

  Future<void> switchInlineQuery(query, [choose_chat_types]);

  Future<void> openLink(url, [options]);

  Future<void> openTelegramLink(String url);

  Future<void> openInvoice(String url, [JsCallback]);

  Future<void> readTextFromClipboard(JsCallback);

  Future<void> showPopup(Record param, [JsCallback]);

  Future<void> showAlert(String message, [JsCallback]);

  Future<void> showConfirm(String message, [JsCallback]);

  Future<void> showScanQrPopup(Record params, [JsCallback]);

  Future<void> closeScanQrPopup();

  void onEvent(String eventType, JsCallback);

  void offEvent(String eventType, JsCallback);
}
