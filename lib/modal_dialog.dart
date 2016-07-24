part of modal_dialog;

typedef void Callback(ModalDialog dialog);

void defaultAction(ModalDialog dialog) => dialog.close();

abstract class ModalDialog {
  Modal get modal;

  void close() {
    modal.hide();
    modal.element.remove();
  }
}
