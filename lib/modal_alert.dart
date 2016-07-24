part of modal_dialog;

class ModalAlert extends ModalDialog {
  ModalMessage _modalMessage;
  DomElement _acceptButton;

  ModalAlert(String title,
      {String text, String html, ActionCallback accept: defaultAction}) {
    _modalMessage = new ModalMessage(title, text: text, html: html);
    _acceptButton = _modalMessage.addButton('Accept', type: 'primary');
    _acceptButton.on('click', () => accept(this));
  }

  Modal get modal => _modalMessage.modal;
}
