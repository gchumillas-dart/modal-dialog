part of modal_dialog;

abstract class ModalDialog {
  Modal get modal;

  void close() {
    modal.hide();
    modal.element.remove();
  }
}
