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
  Future<Null> open();
}
