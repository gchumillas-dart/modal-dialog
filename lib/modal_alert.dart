part of modal_dialog;

// TODO: button messages are customizables (acceptLabel)
// TODO: locale parameters
class ModalAlert extends ModalDialog {
  ModalMessage _modalMessage;

  /// Creates a modal alert dialog with a [title] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [accept] function is called when the 'Accept' button is pressed.
  ModalAlert(String title, String text,
      {bool html, ActionCallback accept: defaultAction}) {
    initializeMessages(Intl.defaultLocale).then((dynamic _) {
      _modalMessage = new ModalMessage(title, text, html: html);
      _modalMessage.addButton(ButtonMessage.accept,
          action: accept, type: 'primary');
    });
  }

  Modal get modal => _modalMessage?.modal;
}
