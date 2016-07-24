part of modal_dialog;

class ModalConfirm extends ModalDialog {
  ModalMessage _modalMessage;
  DomElement _acceptButton;

  /// Creates a modal confirm dialog with a [text] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  ModalConfirm(String title, {String text, String html}) {
    _modalMessage = new ModalMessage(title, text: text, html: html);
    _modalMessage.addButton('No')..on('click', () => _modalMessage.close());
    _acceptButton = _modalMessage.addButton('Yes', type: 'primary');
  }

  Modal get modal => _modalMessage.modal;

  void onAccept(Function listener) => _acceptButton.on('click', listener);
}
