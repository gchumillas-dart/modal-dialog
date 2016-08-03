part of modal_dialog;

/// A modal confirm dialog.
///
/// It consists on a modal message with a 'Cancel' button and an 'Accept'
/// button.
///
///     // Shows a modal confirm dialog.
///     new ModalConfirm('Delete item', 'Are you sure?');
///
///     // When the user presses the 'Accept' button, it prints a message
///     // and closes the modal dialog.
///     new ModalConfirm('Delete item', 'Are you sure?',
///       accept: (ModalDialog dialog) {
///         print('Deleting record...');
///         dialog.close();
///     });
///
///     // Creates a 'hidden' modal dialog and then
///     // accesses the modal instance.
///     ModalDialog dialog =
///       new ModalConfirm('Delete item', 'Are you sure?', show: false);
///     dialog.open().then((Modal modal) {
///       // We can access the modal instance here.
///       modal.show();
///     });
///
class ModalConfirm extends ModalMessage {
  Future<Modal> _open;
  String _locale;
  String _acceptLabel;
  String _cancelLabel;
  _ActionCallback _accept;
  _ActionCallback _cancel;

  /// Creates a modal confirm dialog with a [title] and a [text].
  ///
  /// The text can be either plain-text or HTML, depending on the [html] flag.
  /// The button labels depends on the [locale] parameter, even though they can
  /// be changed directly from the [acceptLabel] and [cancelLabel] parameters.
  ///
  /// When the users presses the 'Accept' or the 'Cancel' button, the dialog
  /// calls the [accept] and the [cancel] functions respectively.
  ModalConfirm(String title, String text,
      {bool html,
      String locale,
      String acceptLabel,
      String cancelLabel,
      _ActionCallback accept: _defaultAction,
      _ActionCallback cancel: _defaultAction})
      : super(title, text, html: html) {
    this._locale = locale;
    this._acceptLabel = acceptLabel;
    this._cancelLabel = cancelLabel;
    this._accept = accept;
    this._cancel = cancel;
  }

  @override
  Future<Modal> open() {
    if (_open == null) {
      _open = new Future<Modal>(() async {
        String locale = await _getLocale(_locale);
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
