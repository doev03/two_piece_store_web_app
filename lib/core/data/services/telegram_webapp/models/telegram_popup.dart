/*
import '../telegram_web_app.dart';

enum PopupButtonType { cancel, ok, close, destructive }

class TelegramPopup {
  TelegramPopup({
    required this.title,
    required this.message,
    this.buttons,
    this.onTap,
  });

  String title;
  String message;
  List<PopupButton>? buttons;
  void Function(String buttonId)? onTap;

  /// use [TelegramPopup.show()] to show the popup
  void show() {
    final buttonsList = buttons
        ?.map(
          (PopupButton? e) => (id: e?.id, type: e?.type?.name ?? 'default', text: e?.text),
        )
        .toList();
    showPopup(
      (
        title: title,
        message: message,
        buttons: buttonsList ?? [(id: 'cancel', type: 'cancel', text: 'Cancel')]
      ),
      JsCallback<String>((String buttonId) {
        onTap?.call(buttonId);
      }),
    );
  }
}

class PopupButton {
  PopupButton({
    required this.id,
    this.type,
    this.text,
  });

  String id;
  PopupButtonType? type;
  String? text;
}
*/
