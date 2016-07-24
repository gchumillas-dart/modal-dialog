part of modal_dialog;

class ModalAlert extends ModalDialog {
  ModalMessage _modalMessage;
  DomElement _acceptButton;

  ModalAlert(String title, {String text, String html}) {
    _modalMessage = new ModalMessage(title, text: text, html: html);
    _acceptButton = _modalMessage.addButton('Accept', type: 'primary');
  }

  Modal get modal => _modalMessage.modal;
}
