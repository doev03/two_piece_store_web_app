
import '../models/theme_params.dart';

typedef ViewPortListener = Function(bool isStable, double height, double stableHeight);
typedef ThemeChangeListener = Function(bool isDarkMode, WebAppThemeParams params);

class TelegramWebEvent {
/*  /// Event listeners for Telegram WebViewPort Changes
  static void setViewPortChangeListener(ViewPortListener listener) {
    onEvent(
      TelegramWebEventType.viewportChanged,
      JsCallback<dynamic>((data) {
        final isStateStable = (data?.isStateStable as bool?) ?? false;
        final height = viewportHeight;
        final stableHeight = viewportStableHeight;
        listener(isStateStable, height ?? 0, stableHeight ?? 0);
      }),
    );
  }

  /// Event listeners for Telegram theme changes, this will return [isDarkMode], but also
  /// we can get [themeParams] from [tg.themeParams] to get the theme colors
  static void setThemeChangeListener(ThemeChangeListener listener) => onEvent(
      TelegramWebEventType.themeChanged,
      jsVoidCallback(() => listener.call(isDarkMode, themeParams)));*/
}

/// Event types for Telegram Web
/// we can use [onEvent] to listen to these events
/// or few examples are added in [TelegramWebEvent] to listen to these events
class TelegramWebEventType {
  static const String themeChanged = "themeChanged";
  static const String viewportChanged = "viewportChanged";
  static const String mainButtonClicked = "mainButtonClicked";
  static const String backButtonClicked = "backButtonClicked";
  static const String settingsButtonClicked = "settingsButtonClicked";
  static const String invoiceClosed = "invoiceClosed";
  static const String popupClosed = "popupClosed";
  static const String qrTextReceived = "qrTextReceived";
  static const String clipboardTextReceived = "clipboardTextReceived";
}
