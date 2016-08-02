part of modal_dialog;

class ModalConfirm extends _ModalPreset {
  Future<Modal> _open;
  String _acceptLabel;
  String _cancelLabel;
  _ActionCallback _accept;
  _ActionCallback _cancel;

  /// Creates a modal confirm dialog with a [text] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [cancel] and [accept] callbacks are called when the 'Cancel' or
  /// 'Accept' button are pressed, respectively.
  ModalConfirm(String title, String text,
      {bool html,
      bool show: true,
      String locale,
      String acceptLabel,
      String cancelLabel,
      _ActionCallback accept: _defaultAction,
      _ActionCallback cancel: _defaultAction})
      : super(locale, title, text, html: html) {
    this._locale = locale;
    this._acceptLabel = acceptLabel;
    this._cancelLabel = cancelLabel;
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
          addButton(_cancelLabel ?? ButtonMessage.cancel, action: _cancel);
          addButton(_acceptLabel ?? ButtonMessage.accept,
              action: _accept, type: 'primary');
        });
        return super.open();
      });
    }
    return _open;
  }
}
