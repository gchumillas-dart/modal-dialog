part of modal_dialog;

/// An abstract modal dialog.
///
/// This is the base class for all modal dialogs.
abstract class ModalDialog {
  /// Gets the modal instance
  Modal get modal;

  /// Closes the modal dialog.
  Future<Null> close() async {
    modal.hide();
    modal.element.remove();
  }

  /// Opens the modal dialog.
  Future<Modal> open();
}
