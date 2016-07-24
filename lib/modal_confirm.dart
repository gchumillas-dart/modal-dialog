part of modal_dialog;

class ModalConfirm extends ModalDialog {
  ModalMessage _modalMessage;

  /// Creates a modal confirm dialog with a [text] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [cancel] and [accept] callbacks are called when the 'Cancel' or
  /// 'Accept' button are pressed, respectively.
  ModalConfirm(String title,
      {String text,
      String html,
      ActionCallback cancel: defaultAction,
      ActionCallback accept: defaultAction}) {
    _modalMessage = new ModalMessage(title, text: text, html: html);

    _modalMessage
      ..addButton('Cancel', action: cancel)
      ..addButton('Accept', action: accept, type: 'primary');
  }

  Modal get modal => _modalMessage.modal;
}
