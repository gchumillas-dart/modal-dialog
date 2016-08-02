part of modal_dialog;

class ModalConfirm extends ModalMessage {
  Future<Modal> _open;
  ActionCallback _accept;
  ActionCallback _cancel;

  /// Creates a modal confirm dialog with a [text] and a message.
  ///
  /// The message can be either a plain [text] or a [html] text.
  /// The [cancel] and [accept] callbacks are called when the 'Cancel' or
  /// 'Accept' button are pressed, respectively.
  ModalConfirm(String title, String text,
      {bool html,
      ActionCallback accept: defaultAction,
      ActionCallback cancel: defaultAction})
      : super(title, text, html: html, show: false) {
    this._accept = accept;
    this._cancel = cancel;
    open();
  }

  Future<Modal> open() async {
    if (_open == null) {
      _open = new Future<Modal>(() async {
        await new Future.delayed(new Duration(seconds: 1), () {
          initializeMessages(Intl.defaultLocale).then((dynamic _) {
            addButton(ButtonMessage.cancel, action: _cancel);
            addButton(ButtonMessage.accept, action: _accept, type: 'primary');
          });
        });
        /*
        await initializeMessages(Intl.defaultLocale).then((dynamic _) {
          addButton(ButtonMessage.cancel, action: _cancel);
          addButton(ButtonMessage.accept, action: _accept, type: 'primary');
        });*/
        return super.open();
      });
    }
    return _open;
  }
}
