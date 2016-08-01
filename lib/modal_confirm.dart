part of modal_dialog;

class ModalConfirm extends ModalDialog {
  ModalMessage _modalMessage;

  /// Creates a modal confirm dialog with a [text] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [cancel] and [accept] callbacks are called when the 'Cancel' or
  /// 'Accept' button are pressed, respectively.
  ModalConfirm(String title, String text,
      {bool html,
      ActionCallback cancel: defaultAction,
      ActionCallback accept: defaultAction}) {
    _modalMessage = new ModalMessage(title, text, html: html);

    _modalMessage
      ..addButton(ButtonMessage.cancel, action: cancel)
      ..addButton(ButtonMessage.accept, action: accept, type: 'primary');
  }

  Future<Modal> open() => null;
}
