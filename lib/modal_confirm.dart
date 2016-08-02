part of modal_dialog;

class ModalConfirm extends ModalMessage {
  Future<Modal> _open;
  String _locale;
  ActionCallback _accept;
  ActionCallback _cancel;

  /// Creates a modal confirm dialog with a [text] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [cancel] and [accept] callbacks are called when the 'Cancel' or
  /// 'Accept' button are pressed, respectively.
  ModalConfirm(String title, String text,
      {bool html,
      bool show: true,
      String locale,
      ActionCallback accept: defaultAction,
      ActionCallback cancel: defaultAction})
      : super(title, text, html: html, show: false) {
    this._locale = locale;
    this._accept = accept;
    this._cancel = cancel;
    if (show) open();
  }

  @override
  Future<Modal> open() {
    if (_open == null) {
      _open = new Future<Modal>(() async {
        String locale = await _getLocale();
        await initializeMessages(locale);
        Intl.withLocale(locale, () {
          addButton(ButtonMessage.cancel, action: _cancel);
          addButton(ButtonMessage.accept, action: _accept, type: 'primary');
        });
        return super.open();
      });
    }
    return _open;
  }

  Future<String> _getLocale() async {
    String ret;
    Stream<String> locales = new Stream<String>.fromFutures(<Future<String>>[
      new Future<String>.value(_locale),
      new Future<String>.value(Intl.defaultLocale),
      findSystemLocale()
    ]);
    await for (String locale in locales) {
      if (locale != null && locale.length > 0) {
        ret = locale;
        break;
      }
    }
    return ret;
  }
}
