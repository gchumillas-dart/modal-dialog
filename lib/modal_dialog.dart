part of modal_dialog;

/// An abstract modal dialog.
///
/// This is the base class for all modal dialogs.
abstract class ModalDialog {
  /// Gets the modal instance
  Modal get modal;

  /// Closes the modal dialog.
  void close() {
    modal.hide();
    modal.element.remove();
  }

  /// Opens the modal dialog.
  ///
  /// Note that this method is asynchronous. That means that the modal dialog
  /// is not open instantly. For example:
  ///
  ///     // Note the use of the 'await' keyword
  ///     ModalDialog dialog = new ModalLoading();
  ///     await dialog.open();
  ///     String contents = await HttpRequest.getString(url);
  ///     dialog.close();
  ///
  Future<Null> open();
}
