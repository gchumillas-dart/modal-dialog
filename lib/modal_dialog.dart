part of modal_dialog;

typedef void ActionCallback(ModalDialog dialog);

abstract class ModalDialog {
  Modal get modal;

  void close() {
    modal.hide();
    modal.element.remove();
  }
}
