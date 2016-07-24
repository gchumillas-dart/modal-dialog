part of modal_dialog;

class ModalAlert extends ModalDialog {
  ModalMessage _modalMessage;
  DomElement _acceptButton;

  /// Creates a modal alert dialog with a [title] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [accept] callback is called when the 'Accept' button is pressed.
  ModalAlert(String title,
      {String text, String html, ActionCallback accept: defaultAction}) {
    _modalMessage = new ModalMessage(title, text: text, html: html);
    _acceptButton = _modalMessage.addButton('Accept', type: 'primary');
    _acceptButton.on('click', () => accept(this));
  }

  Modal get modal => _modalMessage.modal;
}
