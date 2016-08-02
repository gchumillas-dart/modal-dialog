part of modal_dialog;

// TODO: button messages are customizables (acceptLabel)
// TODO: locale parameters
// TODO: colors (warning, etc...)
class ModalAlert extends _ModalPreset {
  Future<Modal> _open;
  _ActionCallback _accept;

  /// Creates a modal alert dialog with a [title] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [accept] function is called when the 'Accept' button is pressed.
  ModalAlert(String title, String text,
      {bool html,
      bool show: true,
      String locale,
      _ActionCallback accept: _defaultAction})
      : super(locale, title, text, html: html) {
    this._locale = locale;
    this._accept = accept;
    if (show) {
      open();
    }
  }

  @override
  Future<Modal> open() {
    if (_open == null) {
      _open = new Future<Modal>(() async {
        String locale = await _getLocale();
        await initializeMessages(locale);
        Intl.withLocale(
            locale,
            () => addButton(ButtonMessage.accept,
                action: _accept, type: 'primary'));
        return super.open();
      });
    }
    return _open;
  }
}
