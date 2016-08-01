part of modal_dialog;

abstract class ModalDialog {
  /// Opens the modal dialog
  Future<Modal> open();

  /// Closes the modal dialog
  Future<Null> close() async {
    Modal m = await open();
    m.hide();
    m.element.remove();
  }
}
