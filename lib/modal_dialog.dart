part of modal_dialog;

/// An abstract modal dialog.
///
/// This is the base class for all modal dialogs.
abstract class ModalDialog {
  /// Closes the modal dialog.
  Future<Null> close() async {
    Modal m = await open();
    m.hide();
    m.element.remove();
  }

  /// Opens the modal dialog.
  Future<Modal> open();
}
