import 'package:js/js.dart';

///https://core.telegram.org/bots/webapps#hapticfeedback
@JS()
class TelegramHapticFeedbackDTO {
  external void impactOccurred(style);
  external void notificationOccurred(type);
  external void selectionChanged();
}
