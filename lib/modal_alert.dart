part of modal_dialog;

class ModalAlert extends ModalDialog {
  ModalMessage _modalMessage;

  /// Creates a modal alert dialog with a [title] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [accept] callback is called when the 'Accept' button is pressed.
  ModalAlert(String title,
      {String text, String html, ActionCallback accept: defaultAction}) {
    _modalMessage = new ModalMessage(title, text: text, html: html);
    _modalMessage.addButton('Accept', action: accept, type: 'primary');
  }

  Modal get modal => _modalMessage.modal;
}
