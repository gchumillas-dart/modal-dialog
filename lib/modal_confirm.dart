part of modal_dialog;

class ModalConfirm extends ModalDialog {
  String _title;
  String _text;
  bool _html;
  ActionCallback _accept;
  ActionCallback _cancel;
  ModalMessage _modalMessage;

  /// Creates a modal confirm dialog with a [text] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [cancel] and [accept] callbacks are called when the 'Cancel' or
  /// 'Accept' button are pressed, respectively.
  ModalConfirm(this._title, this._text,
      {bool html,
      bool show: true,
      ActionCallback cancel: defaultAction,
      ActionCallback accept: defaultAction}) {
    this._html = html;
    this._accept = accept;
    this._cancel = cancel;

    if (show) {
      open();
    }
  }

  Future<Modal> open() async {
    if (_modalMessage == null) {
      _modalMessage = new ModalMessage(_title, _text, html: _html, show: false);
      await initializeMessages(Intl.defaultLocale).then((dynamic _) {
        _modalMessage
          ..addButton(ButtonMessage.cancel, action: _cancel)
          ..addButton(ButtonMessage.accept, action: _accept, type: 'primary');
      });
    }
    return _modalMessage.open();
  }
}
