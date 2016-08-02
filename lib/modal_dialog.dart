part of modal_dialog;

abstract class ModalDialog {
  /// Closes the modal dialog
  Future<Null> close() async {
    Modal m = await open();
    m.hide();
    m.element.remove();
  }

  /// Opens the modal dialog
  Future<Modal> open();
}
