import '../dto/web_app_theme_params.dart';
import '../services/telegram_webapp/telegram_web_app.dart' as tg;
import 'telegram_web_app_remote_data_source.dart';

class TelegramWebAppRemoteDataSourceImpl implements TelegramWebAppRemoteDataSource {
  /// Getters for properties
  ///
  @override
  String get initData => tg.initData;

  @override
  String get version => tg.version;

  @override
  String get platform => tg.platform;

  @override
  String get colorScheme => tg.colorScheme;

  @override
  String get headerColor => tg.headerColor;

  @override
  String get backgroundColor => tg.backgroundColor;

  @override
  bool get isClosingConfirmationEnabled => tg.isClosingConfirmationEnabled;

  @override
  bool get isExpanded => tg.isExpanded;

  @override
  double? get viewportHeight => tg.viewportHeight;

  @override
  double? get viewportStableHeight => tg.viewportStableHeight;

  /// Getters for classes and objects
  ///
  @override
  WebAppThemeParamsDTO get themeParams {
    final data = tg.themeParams;
    return WebAppThemeParamsDTO(
      bgColor: data.bg_color,
      textColor: data.text_color,
      hintColor: data.hint_color,
      linkColor: data.link_color,
      buttonColor: data.button_color,
      buttonTextColor: data.button_text_color,
      secondaryBgColor: data.secondary_bg_color,
    );
  }

  /// Functions
  ///
  @override
  Future<void> ready() => tg.ready();

  @override
  Future<void> expand() => tg.expand();

  @override
  Future<void> close() => tg.close();

  @override
  Future<void> enableClosingConfirmation() => tg.enableClosingConfirmation();

  @override
  Future<void> disableClosingConfirmation() => tg.disableClosingConfirmation();

  @override
  Future<void> sendData(dynamic data) => tg.sendData(data);

  @override
  Future<void> isVersionAtLeast(version) => tg.isVersionAtLeast(version);

  @override
  Future<void> setHeaderColor(String color) => tg.setHeaderColor(color);

  @override
  Future<void> setBackgroundColor(String color) => tg.setBackgroundColor(color);

  @override
  Future<void> switchInlineQuery(query, [chooseChatTypes]) =>
      tg.switchInlineQuery(query, chooseChatTypes);

  @override
  Future<void> openLink(url, [options]) => tg.openLink(url, options);

  @override
  Future<void> openTelegramLink(String url) => tg.openTelegramLink(url);

  @override
  Future<void> openInvoice(String url, [JsCallback]) => tg.openInvoice(url, JsCallback);

  @override
  Future<void> readTextFromClipboard(JsCallback) => tg.readTextFromClipboard(JsCallback);

  ///Dialogs
  ///
  /// use [TelegramPopup.show()] to show the popup, instead of this method directly
  @override
  Future<void> showPopup(Record param, [JsCallback]) => tg.showPopup(param, JsCallback);

  @override
  Future<void> showAlert(String message, [JsCallback]) => tg.showAlert(message, JsCallback);

  @override
  Future<void> showConfirm(String message, [JsCallback]) => tg.showConfirm(message, JsCallback);

  @override
  Future<void> showScanQrPopup(Record params, [JsCallback]) => tg.showScanQrPopup(params);

  @override
  Future<void> closeScanQrPopup() => tg.closeScanQrPopup();

  ///Events
  ///
  /// Available events: https://core.telegram.org/bots/webapps#events-available-for-web-apps
  /// use [TelegramWebEventType] to get the event names, and use [JsVoidCallback] for callbacks
  /// or if any callback requires a return value, use [JsCallback] with the return type
  @override
  void onEvent(String eventType, JsCallback) => tg.onEvent(eventType, JsCallback);

  @override
  void offEvent(String eventType, JsCallback) => tg.offEvent(eventType, JsCallback);
}
