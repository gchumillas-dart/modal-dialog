part of modal_dialog;

class ModalConfirm extends ModalDialog {
  ModalMessage _modalMessage;
  DomElement _acceptButton;

  ModalConfirm(String title, {String text, String html}) {
    _modalMessage = new ModalMessage(title, text: text, html: html);
    _modalMessage.addButton('No')..on('click', () => _modalMessage.close());
    _acceptButton = _modalMessage.addButton('Yes', type: 'primary');
  }

  void onAccept(Function listener) => _acceptButton.on('click', listener);

  void close() => _modalMessage.close();
}
