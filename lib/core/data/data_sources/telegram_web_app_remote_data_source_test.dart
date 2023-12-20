import '../dto/web_app_theme_params.dart';
import 'telegram_web_app_remote_data_source.dart';

class TelegramWebAppRemoteDataSourceTest implements TelegramWebAppRemoteDataSource {
  @override
  String get backgroundColor => '#212d3b';

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
  String get colorScheme => 'dark';

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
  String get headerColor => '#212d3b';

  @override
  // TODO: implement initData
  String get initData => throw UnimplementedError();

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
  String get platform => 'android';

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
  WebAppThemeParamsDTO get themeParams => WebAppThemeParamsDTO(
        bgColor: '#212d3b',
        secondaryBgColor: '#151e27',
        textColor: '#ffffff',
        hintColor: '#7d8b99',
        linkColor: '#5eabe1',
        buttonColor: '#50a8eb',
        buttonTextColor: '#ffffff',
      );

  @override
  // TODO: implement version
  String get version => throw UnimplementedError();

  @override
  // TODO: implement viewportHeight
  double? get viewportHeight => throw UnimplementedError();

  @override
  // TODO: implement viewportStableHeight
  double? get viewportStableHeight => throw UnimplementedError();
}
