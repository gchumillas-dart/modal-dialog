part of modal_dialog;

class ModalAlert extends ModalDialog {
  ModalMessage _modal;
  DomElement _acceptButton;

  DomElement get target => _modal.target;

  ModalAlert(String title, {String text, String html}) {
    _modal = new ModalMessage(title, text: text, html: html);
    _acceptButton = _modal.addButton('Accept', type: 'primary');
  }

  void onAccept(Function listener) => _acceptButton.on('click', listener);

  void close() => _modal.close();
}
