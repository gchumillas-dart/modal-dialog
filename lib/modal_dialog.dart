part of modal_dialog;

abstract class ModalDialog {
  /// Gets the modal instance
  Modal get modal;

  /// Closes the modal dialog
  void close() {
    modal.hide();
    modal.element.remove();
  }
}
