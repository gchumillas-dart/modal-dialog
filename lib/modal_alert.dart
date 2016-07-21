part of modal_dialog;

class ModalAlert extends ModalDialog {
  ModalMessage _modal;
  DomElement _acceptButton;

  ModalAlert(String title, String message) {
    _modal = new ModalMessage(title, message);
    _acceptButton = _modal.addButton('Accept', type: 'primary');
  }

  void onAccept(Function listener) {
    _acceptButton.on('click', listener);
  }

  void close() {
    _modal.close();
  }
}
