part of modal_dialog;

// TODO: button messages are customizables (acceptLabel)
// TODO: locale parameters
// TODO: show parameter
class ModalAlert extends ModalMessage {
  Future<Modal> _open;
  ActionCallback _accept;

  /// Creates a modal alert dialog with a [title] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [accept] function is called when the 'Accept' button is pressed.
  ModalAlert(String title, String text,
      {bool html, ActionCallback accept: defaultAction})
      : super(title, text, html: html, show: false) {
    this._accept = accept;
    open();
  }

  @override
  Future<Modal> open() {
    if (_open == null) {
      _open = new Future<Modal>(() async {
        await initializeMessages(Intl.defaultLocale).then((dynamic _) {
          addButton(ButtonMessage.accept, action: _accept, type: 'primary');
        });
        return super.open();
      });
    }
    return _open;
  }
}
