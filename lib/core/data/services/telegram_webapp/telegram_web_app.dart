@JS('Telegram.WebApp')
library telegram_web_app;

import 'package:js/js.dart';

import 'models/models.dart';

/// Getters for properties
///
@override
external String get initData;

@override
external String get version;

@override
external String get platform;

@override
external String get colorScheme;

@override
external String get headerColor;

@override
external String get backgroundColor;

@override
external bool get isClosingConfirmationEnabled;

@override
external bool get isExpanded;

@override
external double? get viewportHeight;

@override
external double? get viewportStableHeight;

/// Getters for classes and objects
///
@override
external WebAppThemeParams get themeParams;

@override
external TelegramBackButton get BackButton;

@override
external TelegramMainButton get MainButton;

@override
external WebAppInitData get initDataUnsafe;

@override
external TelegramHapticFeedback get HapticFeedback;

/// Functions
///
@override
external Future<void> ready();

@override
external Future<void> expand();

@override
external Future<void> close();

@override
external Future<void> enableClosingConfirmation();

@override
external Future<void> disableClosingConfirmation();

@override
external Future<void> sendData(dynamic data);

@override
external Future<void> isVersionAtLeast(version);

@override
external Future<void> setHeaderColor(String color);

@override
external Future<void> setBackgroundColor(String color);

@override
external Future<void> switchInlineQuery(query, [choose_chat_types]);

@override
external Future<void> openLink(url, [options]);

@override
external Future<void> openTelegramLink(String url);

@override
external Future<void> openInvoice(String url, [JsCallback]);

@override
external Future<void> readTextFromClipboard(JsCallback);

///Dialogs
///
/// use [TelegramPopup.show()] to show the popup, instead of this method directly
@override
external Future<void> showPopup(Record param, [JsCallback]);

@override
external Future<void> showAlert(String message, [JsCallback]);

@override
external Future<void> showConfirm(String message, [JsCallback]);

@override
external Future<void> showScanQrPopup(Record params, [JsCallback]);

@override
external Future<void> closeScanQrPopup();

///Events
///
/// Available events: https://core.telegram.org/bots/webapps#events-available-for-web-apps
/// use [TelegramWebEventType] to get the event names, and use [JsVoidCallback] for callbacks
/// or if any callback requires a return value, use [JsCallback] with the return type
@override
external void onEvent(String eventType, JsCallback);

@override
external void offEvent(String eventType, JsCallback);
