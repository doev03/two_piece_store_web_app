import '../dto/telegram_back_button.dart';
import '../dto/telegram_haptic_feedback.dart';
import '../dto/telegram_main_button.dart';
import '../dto/theme_params.dart';
import '../dto/web_app_init_data.dart';

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

  TelegramBackButtonDTO get BackButton;

  TelegramMainButtonDTO get MainButton;

  WebAppInitDataDTO get initDataUnsafe;

  TelegramHapticFeedbackDTO get HapticFeedback;

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

/*class TelegramWebAppRemoteDataSourceDebugTest implements TelegramWebAppRemoteDataSource {
  final theme = {
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
  };

  @override
  // TODO: implement BackButton
  TelegramBackButtonDTO get BackButton => TelegramBackButtonDTO();

  @override
  // TODO: implement HapticFeedback
  TelegramHapticFeedbackDTO get HapticFeedback => throw UnimplementedError();

  @override
  // TODO: implement MainButton
  TelegramMainButtonDTO get MainButton => throw UnimplementedError();

  @override
  // TODO: implement backgroundColor
  String get backgroundColor => throw UnimplementedError();

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<void> closeScanQrPopup() {
    // TODO: implement closeScanQrPopup
    throw UnimplementedError();
  }

  @override
  // TODO: implement colorScheme
  String get colorScheme => throw UnimplementedError();

  @override
  Future<void> disableClosingConfirmation() {
    // TODO: implement disableClosingConfirmation
    throw UnimplementedError();
  }

  @override
  Future<void> enableClosingConfirmation() {
    // TODO: implement enableClosingConfirmation
    throw UnimplementedError();
  }

  @override
  Future<void> expand() {
    // TODO: implement expand
    throw UnimplementedError();
  }

  @override
  // TODO: implement headerColor
  String get headerColor => throw UnimplementedError();

  @override
  // TODO: implement initData
  String get initData => throw UnimplementedError();

  @override
  // TODO: implement initDataUnsafe
  WebAppInitDataDTO get initDataUnsafe => throw UnimplementedError();

  @override
  // TODO: implement isClosingConfirmationEnabled
  bool get isClosingConfirmationEnabled => throw UnimplementedError();

  @override
  // TODO: implement isExpanded
  bool get isExpanded => throw UnimplementedError();

  @override
  Future<void> isVersionAtLeast(version) {
    // TODO: implement isVersionAtLeast
    throw UnimplementedError();
  }

  @override
  void offEvent(String eventType, JsCallback) {
    // TODO: implement offEvent
  }

  @override
  void onEvent(String eventType, JsCallback) {
    // TODO: implement onEvent
  }

  @override
  Future<void> openInvoice(String url, [JsCallback]) {
    // TODO: implement openInvoice
    throw UnimplementedError();
  }

  @override
  Future<void> openLink(url, [options]) {
    // TODO: implement openLink
    throw UnimplementedError();
  }

  @override
  Future<void> openTelegramLink(String url) {
    // TODO: implement openTelegramLink
    throw UnimplementedError();
  }

  @override
  // TODO: implement platform
  String get platform => throw UnimplementedError();

  @override
  Future<void> readTextFromClipboard(JsCallback) {
    // TODO: implement readTextFromClipboard
    throw UnimplementedError();
  }

  @override
  Future<void> ready() {
    // TODO: implement ready
    throw UnimplementedError();
  }

  @override
  Future<void> sendData(data) {
    // TODO: implement sendData
    throw UnimplementedError();
  }

  @override
  Future<void> setBackgroundColor(String color) {
    // TODO: implement setBackgroundColor
    throw UnimplementedError();
  }

  @override
  Future<void> setHeaderColor(String color) {
    // TODO: implement setHeaderColor
    throw UnimplementedError();
  }

  @override
  Future<void> showAlert(String message, [JsCallback]) {
    // TODO: implement showAlert
    throw UnimplementedError();
  }

  @override
  Future<void> showConfirm(String message, [JsCallback]) {
    // TODO: implement showConfirm
    throw UnimplementedError();
  }

  @override
  Future<void> showPopup(Record param, [JsCallback]) {
    // TODO: implement showPopup
    throw UnimplementedError();
  }

  @override
  Future<void> showScanQrPopup(Record params, [JsCallback]) {
    // TODO: implement showScanQrPopup
    throw UnimplementedError();
  }

  @override
  Future<void> switchInlineQuery(query, [choose_chat_types]) {
    // TODO: implement switchInlineQuery
    throw UnimplementedError();
  }

  @override
  // TODO: implement themeParams
  WebAppThemeParamsDTO get themeParams => throw UnimplementedError();

  @override
  // TODO: implement version
  String get version => throw UnimplementedError();

  @override
  // TODO: implement viewportHeight
  double? get viewportHeight => throw UnimplementedError();

  @override
  // TODO: implement viewportStableHeight
  double? get viewportStableHeight => throw UnimplementedError();
}*/
