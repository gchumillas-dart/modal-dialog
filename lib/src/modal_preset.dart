part of modal_dialog;

void _defaultAction(ModalDialog dialog) {
  dialog.close();
}

typedef void _ActionCallback(ModalDialog dialog);

abstract class _ModalPreset extends ModalMessage {
  String _locale;

  _ModalPreset(this._locale, String title, String text, {bool html})
      : super(title, text, html: html, show: false);

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
